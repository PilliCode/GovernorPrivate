use ethers::types::Bytes;
use num_bigint::BigInt;
use rocket::serde::json::Json;
use rocket::serde::{Deserialize, Serialize};
use std::io::Write;
use std::process::Command;
use std::sync::Arc;
use std::fs::File;
use hex::FromHex;

use ark_crypto_primitives::Error;

use ethers::{
    contract::abigen,
    core::types::{Address, Filter},
    providers::{Http, Middleware, Provider}
};

use crate::constants::{DEFAULT_USER, GOV_ADDRESS};

use crate::bjj_ah_elgamal;
use crate::util::{get_ct, get_log_data, get_pk, get_token_bal};
use std::str::FromStr;
use std::time::SystemTime;

#[derive(Serialize, Deserialize)]
pub struct UserAddr {
    // Define your structure to deserialize the data
    addr: String,
}

abigen!(
    GOV,
    "/Users/pillicruz-dejesus/gov_private_bravo/gov_foundry/out/GovernorBravoDelegate.sol/GovernorBravoDelegate.json";

    TokenContract,
    "/Users/pillicruz-dejesus/gov_private_bravo/backend/rust_web_server/src/abi/PrivateToken.json";
);


#[post("/delegate_unregistration", format = "json", data = "<data>")]
pub async fn delegate_unregistration_call(data: Json<UserAddr>) -> &'static str {
    match delegate_unregistration_helper(data).await{
        Ok(_) => "Success",
        Err(_) => "failure"
    }
}

#[options("/delegate_unregistration")]
pub fn options_delegate_unregistration() -> &'static str {
    "OK"
}

async fn delegate_unregistration_helper(data: Json<UserAddr>) -> Result<String,Error> {
    let start_time = SystemTime::now();
    println!("Starting delegate unregistration");

    let (pk_x, pk_y) = get_log_data().await?;

    let token_bal = get_token_bal(DEFAULT_USER.to_string()).await?;

    let pk = get_pk(pk_x.clone(), pk_y.clone())?;

    let old_ct = get_ct(&data.addr).await?;

    /* old on chain bal */
    let old_c_e_x =  bjj_ah_elgamal::point_x_str(&old_ct.0.affine());
    let old_c_e_y =  bjj_ah_elgamal::point_y_str(&old_ct.0.affine());
    let old_c_v_x =  bjj_ah_elgamal::point_x_str(&old_ct.1.affine());
    let old_c_v_y =  bjj_ah_elgamal::point_y_str(&old_ct.1.affine());

    /* user balance encrypted again */ 
    let enc_user_bal = bjj_ah_elgamal::encrypt(&token_bal, &pk, &BigInt::from_str("0").unwrap());

    /* subtract balances error could arise here this assumes that the users new balance is equal to the one when they registered*/
    let new_ct = bjj_ah_elgamal::subtract_encryptions(old_ct, enc_user_bal);

    let new_c_e_x =  bjj_ah_elgamal::point_x_str(&new_ct.0.affine());
    let new_c_e_y =  bjj_ah_elgamal::point_y_str(&new_ct.0.affine());
    let new_c_v_x =  bjj_ah_elgamal::point_x_str(&new_ct.1.affine());
    let new_c_v_y =  bjj_ah_elgamal::point_y_str(&new_ct.1.affine());

    /* create toml for prover */
    let toml_value = toml::toml!{
        e1x = (old_c_e_x.clone())
        e1y = (old_c_e_y.clone())
        v1x = (old_c_v_x.clone())
        v1y = (old_c_v_y.clone())
        tpi = token_bal
        e_resx = (new_c_e_x.clone())
        e_resy = (new_c_e_y.clone())
        v_resx = (new_c_v_x.clone())
        v_resy = (new_c_v_y.clone())
    };

    /* Generate proof */
    let mut file = File::create("/Users/pillicruz-dejesus/gov_private_bravo/privatevotingzkproofs-main/R_encsub/Prover.toml").expect("Failed to create file");
    file.write_all(toml::to_string(&toml_value).unwrap().as_bytes()).expect("Failed to write to file");

    let proof_start_time = start_time.elapsed()?.as_secs();
    println!("Beginning proof generation...");

    let _ = Command::new("nargo").args(["prove"]).current_dir("/Users/pillicruz-dejesus/gov_private_bravo/privatevotingzkproofs-main/R_encsub")
    .output().expect("failed to execute process");

    println!("Proof generation completed. Took {} seconds", start_time.elapsed()?.as_secs()-proof_start_time);

    let proof = std::fs::read_to_string("/Users/pillicruz-dejesus/gov_private_bravo/privatevotingzkproofs-main/R_encsub/proofs/R_encsub.proof")?;

    /* Delegate on chain */
    let delegate_start_time = start_time.elapsed().expect("SystemTime elapsed failed").as_secs();
    println!("Beginning on chain unregistration...");
    undelegate_onchain(token_bal, data.addr.to_string(), 
            old_c_e_x, old_c_e_y, old_c_v_x, old_c_v_y, 
            new_c_e_x, new_c_e_y, new_c_v_x, new_c_v_y, proof).await?;

    println!("On chain unregistration completed. Took {} seconds", start_time.elapsed()?.as_secs()-delegate_start_time);

    println!("Completed after {} seconds", start_time.elapsed()?.as_secs());

    return Ok("true".to_string());
}
   

async fn undelegate_onchain(
    token_bal: u32,
    addr: String, 
    old_c_e_x: String, 
    old_c_e_y: String, 
    old_c_v_x: String, 
    old_c_v_y: String,
    new_c_e_x: String, 
    new_c_e_y: String, 
    new_c_v_x: String, 
    new_c_v_y: String,  
    proof: String, 
                            ) -> Result<bool,Error> {
    /* parse token balance */
    let hex_bal = format!("{:x}", token_bal);
    let zeros_needed = 64 - hex_bal.to_string().len();
    let hex_token_bal = "0".repeat(zeros_needed) + &hex_bal.to_string();


    let provider = Provider::<Http>::try_from("http://localhost:8545")?.with_sender(addr.parse::<Address>()?);    
    let client = Arc::new(provider);
    let contract = GOV::new(GOV_ADDRESS.parse::<Address>()?, client.clone());
    println!("Contract: {:?}",contract.unregister_delegate(<[u8; 32]>::from_hex(hex_token_bal)?, 
    <[u8; 32]>::from_hex(&old_c_e_x[2..])?, 
    <[u8; 32]>::from_hex(&old_c_e_y[2..])?, 
    <[u8; 32]>::from_hex(&old_c_v_x[2..])?, 
    <[u8; 32]>::from_hex(&old_c_v_y[2..])?, 
    <[u8; 32]>::from_hex(&new_c_e_x[2..])?, 
    <[u8; 32]>::from_hex(&new_c_e_y[2..])?, 
    <[u8; 32]>::from_hex(&new_c_v_x[2..])?, 
    <[u8; 32]>::from_hex(&new_c_v_y[2..])?, 
    Bytes::from_hex(proof)?).send().await);
    
    /* Check for emit log uncomment for additional info */
    // let sleep_duration = Duration::from_secs(1);
    // thread::sleep(sleep_duration);

    // let filter = Filter::new()
    // .address(GOV_ADDRESS.parse::<Address>()?)
    // .event("UnregisterDelegate(address,bool,bool,uint256,uint256)")
    // .topic1(addr.parse::<Address>()?)
    // .from_block(0);
    // let logs = client.get_logs(&filter).await?;
    // println!("logs: {}", logs.len());
    // if logs.len() >= 1 {
    //     println!("Successfully UnRegistered As Delegate Found {} logs", logs.len());
    // }
    Ok(true)
}
