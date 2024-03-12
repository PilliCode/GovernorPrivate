use rocket::serde::json::Json;
use ark_crypto_primitives::Error;
use ethers::{
        contract::{Abigen,abigen},
    core::types::{Address, Filter, U256},
    providers::{Http, Middleware, Provider},
    utils::{parse_units, ParseUnits},
};
//use ethers_contract_abigen::Abigen;

use std::{sync::Arc, time::SystemTime};
use crate::utils::util::{get_rt, write_to_file, StoredSk}; // requires 'getrandom' feature
use crate::utils::constants::{DEFAULT_USER, GOV_ADDRESS, TOKEN_CONTRACT_ADDRESS,TIMELOCK_CONTRACT_ADDRESS};
use hex::FromHex;
use crate::bjj_ah_elgamal;
use serde::Deserialize;
use k256::ecdsa::{SigningKey, Signature, signature::Signer,VerifyingKey, signature::Verifier};
use num_traits::ToPrimitive;
use std::thread;
use std::time::Duration;
use rand_core::OsRng;

#[derive(Deserialize)]
pub struct DaoData {
  // Define your structure to deserialize the data
  dao_name: String,
  token_addr: String,
}




async fn trusted_auth_helper(dao_data: Json<DaoData>) -> Result<String,Error> {
    let start_time = SystemTime::now();
    println!("Starting setup...");

    println!("Dao name: {}", dao_data.dao_name);
    println!("TokenAddr: {}",dao_data.token_addr);

    /* pk and sk for additive homomorphic */
    let sk = bjj_ah_elgamal::get_sk();
    let pk = bjj_ah_elgamal::sk_to_pk(&sk);

    /* pk and sk for for signature from https://docs.rs/k256/latest/k256/ecdsa/ */
    let sig_sk = SigningKey::random(&mut OsRng);

    let sig_pk = VerifyingKey::from(&sig_sk);

    /* search through emit logs to create balance mapping */
    let (rt,_rt_path) = get_rt().await?;

    /* Sign merkle root and verify it  */
    let rt_sig: Signature = sig_sk.sign(rt.to_string().as_bytes());
    assert!(sig_pk.verify(rt.to_string().as_bytes(), &rt_sig).is_ok());

    /*Write keys, signatures to file keys.txt */
    let d = StoredSk {
        sk: sk.to_u128().unwrap(),
    };
    write_to_file("sk.txt", &d)?;

    deploy_governance(bjj_ah_elgamal::point_x_str(&pk), bjj_ah_elgamal::point_y_str(&pk), rt.to_string(), rt_sig.to_string(), sig_pk.to_encoded_point(true).to_string()).await?;
    println!("Completed: {}",start_time.elapsed().expect("SystemTime elapsed failed").as_secs());
    return Ok(format!("{}{}{:?}{:?}{:?}", bjj_ah_elgamal::point_x_str(&pk), bjj_ah_elgamal::point_y_str(&pk), sig_pk, rt, rt_sig));
}



async fn deploy_governance(pk_x: String, pk_y: String, rt_str: String, rt_sig_str: String, sig_pk_str: String) -> Result<String,Error> {
    abigen!(
        Gov,
        "../../trusted_auth/rust_web_server/src/abi/GovernorBravoDelegate.json";
        Timelock,
        "../../trusted_auth/rust_web_server/src/abi/Timelock.json";
    );
    // let provider = Provider::<Http>::try_from("http://foundry:8545")?.with_sender(DEFAULT_USER.parse::<Address>()?);
    let provider = Provider::<Http>::try_from("http://foundry:8545")?.with_sender(DEFAULT_USER.parse::<Address>()?);
    let client = Arc::new(provider);
    println!("before timelock ");

    /* deploy timelock */
    let _ = Timelock::deploy(client.clone(), (DEFAULT_USER.parse::<Address>()?, U256::from(172800)))?.send().await?;
    println!("Deployed timelock contract");

    /* deploy governance */
    let pu: ParseUnits = parse_units("1000.0", "ether").unwrap();
    let num = U256::from(pu);
    let gov = Gov::deploy(client.clone(), (TIMELOCK_CONTRACT_ADDRESS.parse::<Address>()?, TOKEN_CONTRACT_ADDRESS.parse::<Address>()?, U256::from(10000), U256::from(2), num))?.send().await?;
        
    /*initialize governance */
    let start_time = SystemTime::now();
    println!("Beginning gov intialization...");

    println!("Gov initialize print {:?}:",  gov.initialize_private(<[u8; 32]>::from_hex(&pk_x[2..])?, 
    <[u8; 32]>::from_hex(&pk_y[2..])?,
    <[u8; 32]>::from_hex(&rt_str[5..rt_str.len()-1])?,
    rt_sig_str, 
    sig_pk_str).send().await);
    println!("Gov on chain completed. Took {} seconds", start_time.elapsed()?.as_secs());

    /*  Wait 1 second then check emit log to see if initialize was emitted */
    let sleep_duration = Duration::from_secs(1);
    thread::sleep(sleep_duration);
    let filter = Filter::new()
        .address(GOV_ADDRESS.parse::<Address>()?)
        .event("InitializePrivate(bytes32,bytes32,bytes32,string,string)")
        .from_block(0);
    let logs = client.get_logs(&filter).await?;
    
    println!("logs found: {}", logs.len());
    if logs.len() == 1 {
        println!("Successfully Called InitializePrivate On Gov Contract");
    }
    return Ok("Success".to_string());
}

#[post("/trusted_auth_setup", format = "json", data = "<data>")]
pub async fn trusted_auth_setup(data: Json<DaoData>) -> String {
    match trusted_auth_helper(data).await{
        Ok(contents) => return contents,
        Err(_) => return "Error in trusted auth setup".to_string()
    }
}

#[options("/trusted_auth_setup")]
pub fn options_trusted_auth_setup() -> &'static str {
    "OK"
}