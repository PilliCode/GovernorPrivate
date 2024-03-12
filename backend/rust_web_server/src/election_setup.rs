use ethers::core::k256::ecdsa::SigningKey;
use ethers::middleware::SignerMiddleware;
use ethers::signers::{Signer, Wallet};

use babyjubjub_rs::PointProjective;
use ethers::types::Bytes;
use num_bigint::BigInt;
use rocket::serde::json::Json;
use rocket::serde::{Deserialize, Serialize};
use std::sync::Arc;
use hex::FromHex;

use ark_crypto_primitives::Error;

use ethers::{
        contract::{Abigen,abigen},
    core::types::{Address, Filter, H160, U256},
    providers::{Http, Middleware, Provider},
};
//use ethers_contract_abigen::Abigen;

use crate::constants::GOV_ADDRESS;
use crate::util::{get_log_data, get_pk};
use crate::bjj_ah_elgamal;
use std::str::FromStr;
use std::u128;
use std::thread;
use std::time::{Duration, SystemTime};

#[derive(Serialize, Deserialize)]
pub struct Proposal {
    user_addr: String,
    title: String,
    description: String,
    voting_delay: u128,
    voting_period: u128,
    targets: Vec<String>, 
    values: Vec<String>, 
    signatures: Vec<String>,
    call_datas: Vec<String>, 
}


async fn election_setup_helper(data: Json<Proposal>)-> Result<String,Error>{
    let start_time = SystemTime::now();
    println!("Starting election setup...");
    
    /* get public key of trusted auth */
    let (pk_x, pk_y) = get_log_data().await?;
    let pk = get_pk(pk_x.clone(), pk_y.clone())?;

    /* encrypt 0 for onchain */
    let enc_zero = bjj_ah_elgamal::encrypt(&0, &pk, &BigInt::from_str("0").unwrap());
    
    /* setup election on chain */
    let onchain_start_time = start_time.elapsed().expect("SystemTime elapsed failed").as_secs();
    println!("Beginning on chain registration...");
    election_setup_onchain(data, enc_zero).await?;
    println!("On chain setup completed. Took {} seconds", start_time.elapsed()?.as_secs()-onchain_start_time);
    
    println!("Completed after {} seconds", start_time.elapsed()?.as_secs());
    return Ok("true".to_string());
}


async fn election_setup_onchain(
    data: Json<Proposal>,
    enc_zero: (PointProjective, PointProjective)
    ) -> Result<String,Error> {
   
    abigen!(
        Gov,"../../backend/rust_web_server/src/abi/GovernorBravoDelegate.json";
    );
    /* Used the default key for the first account */
    let wallet: Wallet<SigningKey> = "ac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80".parse()?;    
    let wallet = wallet.with_chain_id(31337_u64);
    // let provider = Provider::<Http>::try_from("http://foundry:8545")?;
    let provider = Provider::<Http>::try_from("http://foundry:8545")?;
    let client = Arc::new(SignerMiddleware::new(provider, wallet));
    let contract = Gov::new(GOV_ADDRESS.parse::<Address>()?, client.clone());

    let cex =  bjj_ah_elgamal::point_x_str(&enc_zero.0.affine());
    let cey =  bjj_ah_elgamal::point_y_str(&enc_zero.0.affine());
    let cvx =  bjj_ah_elgamal::point_x_str(&enc_zero.1.affine());
    let cvy =  bjj_ah_elgamal::point_y_str(&enc_zero.1.affine());
    let ct_0 =  [<[u8; 32]>::from_hex(cex[2..].to_string())?,<[u8; 32]>::from_hex(cey[2..].to_string())?,<[u8; 32]>::from_hex(cvx[2..].to_string())?,<[u8; 32]>::from_hex(cvy[2..].to_string())?];    
    
    /* Only using one executed function call for purpose of this demo */
    let mut targets: Vec<H160> = Vec::new();
    targets.insert(0, data.targets[0].parse::<Address>()?);
    let mut values: Vec<U256> = Vec::new();
    values.insert(0, U256::from_dec_str(&data.values[0])?);

    let mut call_datas: Vec<Bytes> = Vec::new();
    call_datas.insert(0, Bytes::from_hex(data.call_datas[0][2..].to_string())?);

    println!("{:?}",contract.election_setup(
        targets, 
        values, 
        data.signatures.clone(), 
        call_datas, 
        data.title.clone(),
        data.description.clone(), 
        ct_0, 
        U256::from(data.voting_delay), 
        U256::from(data.voting_period),
        ).gas(10000000)
    .send().await);
    
    /* Uncomment for transaction emit log */

    // let sleep_duration = Duration::from_secs(1);
    // thread::sleep(sleep_duration);

    // let filter = Filter::new()
    // .address(GOV_ADDRESS.parse::<Address>()?)
    // .event("ElectionStarted(uint,address,uint,uint,string)")
    // // .topic1(data.userAddr.parse::<Address>()?)
    // .from_block(0);
    // let logs = client.get_logs(&filter).await?;
    // println!("logs: {}", logs.len());
    // if logs.len() >= 1 {
    //     println!("Successfully posted propogal found {} logs", logs.len());
    // }
    Ok("true".to_string())
}



#[post("/election_setup", format = "json", data = "<data>")]
pub async fn election_setup_call(data: Json<Proposal>) -> &'static str {
    match election_setup_helper(data).await{
        Ok(_) => "Success",
        Err(_) => "failure"
    }
}

#[options("/election_setup")]
pub fn options_election_setup() -> &'static str {
    "OK"
}

