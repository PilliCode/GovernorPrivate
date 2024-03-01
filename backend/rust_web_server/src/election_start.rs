use crate::merklehelper;
use rocket::serde::json::Json;
use rocket::serde::{Deserialize, Serialize};
use std::sync::Arc;
use hex::{FromHex, encode};
use ark_crypto_primitives::Error;
use ethers::{
    contract::abigen,
    core::types::{Address, U256},
    providers::{Http, Provider},
};
use poseidon_rs::{Fr, Poseidon};
use ff::PrimeField;
use crate::constants::GOV_ADDRESS;
use crate::util::get_ld;

use std::u128;
use std::time::SystemTime;


#[derive(Serialize, Deserialize)]
pub struct StartInfo {
    // Define your structure to deserialize the data
    user_addr: String,
    id: u128,
}

abigen!(
    GOV,
    "/Users/pillicruz-dejesus/gov_private_bravo/gov_foundry/out/GovernorBravoDelegate.sol/GovernorBravoDelegate.json";
);

#[post("/election_start", format = "json", data = "<data>")]
pub async fn election_start_call(data: Json<StartInfo>) -> &'static str {
    match election_start_helper(data).await{
        Ok(_) => "Success",
        Err(_) => "failure"
    }
}

#[options("/election_start")]
pub fn options_election_start() -> &'static str {
    "OK"
}

async fn election_start_helper(data: Json<StartInfo>)-> Result<String,Error>{
    let start_time = SystemTime::now();
    println!("Starting election...");

    let rt = get_rt_ld().await?;

    let onchain_start_time = start_time.elapsed().expect("SystemTime elapsed failed").as_secs();
    println!("Setting up on chain...");
    election_start_onchain(data, rt).await?;
    println!("On chain setup completed. Took {} seconds", start_time.elapsed()?.as_secs()-onchain_start_time);
    
    println!("Completed after {} seconds", start_time.elapsed()?.as_secs());
    return Ok("true".to_string());
}


async fn election_start_onchain(
    data: Json<StartInfo>,
    rt: String
    ) -> Result<String,Error> {

    println!("Setting up election on chain");
    let provider = Provider::<Http>::try_from("http://localhost:8545")?.with_sender(data.user_addr.parse::<Address>()?);
    let client = Arc::new(provider);
    let contract = GOV::new(GOV_ADDRESS.parse::<Address>()?, client.clone());

    println!("{:?}",contract.election_start(
        U256::from(data.id), 
        <[u8; 32]>::from_hex(rt)?).send().await?);

    Ok("true".to_string())
}

/* get merkle root of ld */
async fn get_rt_ld() -> Result<String,Error> {

    let ld_vec = get_ld().await?;
    
    let mut leaves: Vec<Vec<poseidon_rs::Fr>> = Vec::new();
    for cts in ld_vec.clone() {

        let ct0 = (Fr::from_str(&U256::from_str_radix(&encode(cts[0]),16)?.to_string()).unwrap());
        let ct1 = (Fr::from_str(&U256::from_str_radix(&encode(cts[1]),16)?.to_string()).unwrap());
        let ct2 = (Fr::from_str(&U256::from_str_radix(&encode(cts[2]),16)?.to_string()).unwrap());
        let ct3 = (Fr::from_str(&U256::from_str_radix(&encode(cts[3]),16)?.to_string()).unwrap());
        leaves.push(vec![ct0,ct1,ct2,ct3]);
    }

    let (rt,_) = merklehelper::gen_proof_padded(&leaves, ld_vec.len(), 0).unwrap();
    
    let rt_str = rt.to_string();
    let rt_cut = rt_str[5..rt_str.len()-1].to_string();
    println!("RT_cut: {:?}",rt_cut);
    return Ok(rt_cut);
}



