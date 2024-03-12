use babyjubjub_rs::PointProjective;
use ethers::types::Bytes;
use num_bigint::BigInt;
use rocket::serde::json::Json;
use rocket::serde::{Deserialize, Serialize};
use std::io::Write;
use std::process::Command;
use std::sync::Arc;
use std::fs::File;
use hex::FromHex;
use toml;
use ark_crypto_primitives::Error;

use ethers::{
        contract::{Abigen,abigen},
    core::types::{Address, U256},
    providers::{Http, Provider},
};
//use ethers_contract_abigen::Abigen;

use crate::utils::constants::GOV_ADDRESS;
use crate::utils::util::{get_log_data, pad_hex, read_from_file, u832_to_pointprojective, create_cts};
use crate::bjj_ah_elgamal;

use std::u128;
use std::time::SystemTime;


#[derive(Serialize, Deserialize)]
pub struct TallyInfo {
    // Define your structure to deserialize the data
    user_addr: String,
    id: u128,
}



async fn decrypt_tally_helper(data: Json<TallyInfo>)-> Result<String,Error>{
    let start_time = SystemTime::now();
    let (pk_x, pk_y) = get_log_data().await?;

    let sk = BigInt::from(read_from_file("sk.txt")?.sk);

    let (for_votes, against_votes, abstain_votes) = get_encrypted_votes(&data).await?;

    /* decrypt votes */
    let for_decrypted = bjj_ah_elgamal::decrypt(&sk, for_votes.clone());
    let against_decrypted = bjj_ah_elgamal::decrypt(&sk, against_votes.clone());
    let abstain_decrypted = bjj_ah_elgamal::decrypt(&sk, abstain_votes.clone());

    /* convert to percents */
    let total = for_decrypted+against_decrypted+abstain_decrypted;
    let for_percent = if for_decrypted !=0 {for_decrypted * 10_000/total} else {0};
    let against_percent = if against_decrypted != 0 {against_decrypted * 10_000 /total} else {0};
    let abstain_percent = if abstain_decrypted != 0 {abstain_decrypted * 10_000 /total} else {0};


    println!("FOR: {}", for_decrypted);
    println!("Against: {}", against_decrypted);
    println!("Abstain: {}", abstain_decrypted);

 
    /* Format for prover */
    let cts = create_cts(for_votes,against_votes,abstain_votes);
    let sk_padded = pad_hex(&sk.to_str_radix(16));
    let for_decrypted_hex = pad_hex(&format!("{:x}",for_decrypted));
    let against_decrypted_hex = pad_hex(&format!("{:x}",against_decrypted));
    let abstain_decrypted_hex = pad_hex(&format!("{:x}",abstain_decrypted));
    let vote_counts = vec![for_decrypted_hex,against_decrypted_hex,abstain_decrypted_hex];
    let percents = vec![for_percent,against_percent,abstain_percent];

    let toml_value = toml::toml!{
        pk_x = pk_x
        pk_y = pk_y
        cts = cts
        vote_counts = vote_counts
        sk = sk_padded
        percents = (percents.clone())
    };

    /* Generate and read proof */
    let mut file = File::create("privatevotingzkproofs/R_decpercent/Prover.toml").expect("Failed to create file");
    file.write_all(toml::to_string(&toml_value).unwrap().as_bytes())
        .expect("Failed to write to file");

    println!("Generating proof: {} second(s)",start_time.elapsed().expect("SystemTime elapsed failed").as_secs());
    let _ = Command::new("nargo").args(["prove"]).current_dir("privatevotingzkproofs/R_decpercent")
    .output().expect("failed to execute process");
    println!("Voting on chain timestamp: {} second(s)",start_time.elapsed().expect("SystemTime elapsed failed").as_secs());

    let proof = std::fs::read_to_string("privatevotingzkproofs/R_decpercent/proofs/R_decpercent.proof")?;

    // println!("{}",proof);

    /* Send onchain */
    decrypt_tally_onchain(data, percents, proof).await?;
    println!("Finished: {} second(s)",start_time.elapsed().expect("SystemTime elapsed failed").as_secs());
    return Ok("true".to_string());
}

async fn get_encrypted_votes(data: &Json<TallyInfo>) -> Result<((PointProjective,PointProjective),(PointProjective,PointProjective),(PointProjective,PointProjective)),Error> {
    abigen!(
        Gov,
        "../../trusted_auth/rust_web_server/src/abi/GovernorBravoDelegate.json";
    );

    let provider = Provider::<Http>::try_from("http://foundry:8545")?.with_sender(data.user_addr.parse::<Address>()?);
    let client = Arc::new(provider);
    let contract = Gov::new(GOV_ADDRESS.parse::<Address>()?, client.clone());

    let (for_arr, against_arr, abstain_arr) = contract.get_proposal_votes_all(
        U256::from(data.id.clone()),
    ).call().await?;
    // println!("proposal votes: {:?}", proposal_votes);
    let for_votes = u832_to_pointprojective(&for_arr)?;
    let against_votes = u832_to_pointprojective(&against_arr)?;
    let abstain_votes = u832_to_pointprojective(&abstain_arr)?;

    // println!("for: {:?}", for_votes);
    // println!("against: {:?}", against_votes);
    // println!("abstain: {:?}", abstain_votes);

    Ok((for_votes,against_votes,abstain_votes))    
}

async fn decrypt_tally_onchain(
    data: Json<TallyInfo>,
    percents: Vec<u32>,
    proof_str: String
    ) -> Result<String,Error> {
    abigen!(
        Gov,
        "../../trusted_auth/rust_web_server/src/abi/GovernorBravoDelegate.json";
    );
    println!("Decrypting tally on chain");
    let provider = Provider::<Http>::try_from("http://foundry:8545")?.with_sender(data.user_addr.parse::<Address>()?);
    let client = Arc::new(provider);
    let contract = Gov::new(GOV_ADDRESS.parse::<Address>()?, client.clone());

    let for_percent = <[u8; 32]>::from_hex(&pad_hex(&format!("{:x}",percents[0]))[2..])?;
    let against_percent = <[u8; 32]>::from_hex(&pad_hex(&format!("{:x}",percents[1]))[2..])?;
    let abstain_percent = <[u8; 32]>::from_hex(&pad_hex(&format!("{:x}",percents[2]))[2..])?;
    let percents_onchain = [for_percent,against_percent,abstain_percent];
    println!("{:?}",contract.decrypt_tally(U256::from(data.id),percents_onchain, Bytes::from_hex(proof_str)?).send().await);
    
    Ok("true".to_string())
}

#[post("/decrypt_tally", format = "json", data = "<data>")]
pub async fn decrypt_tally_call(data: Json<TallyInfo>) -> &'static str {
    match decrypt_tally_helper(data).await{
        Ok(_) => "Success",
        Err(_) => "failure"
    }
}

#[options("/decrypt_tally")]
pub fn options_decrypt_tally() -> &'static str {
    "OK"
}
