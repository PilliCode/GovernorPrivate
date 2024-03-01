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
    core::types::Address,
    providers::{Http, Provider},
};

use crate::constants::GOV_ADDRESS;

use crate::bjj_ah_elgamal;
use crate::util::{get_log_data, get_pk, get_token_bal};

use std::str::FromStr;
use std::thread;
use std::time::{Duration, SystemTime};

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


#[options("/delegate_registration")]
pub fn options_delegate_registration() -> &'static str {
    "OK"
}

#[post("/delegate_registration", format = "json", data = "<data>")]
pub async fn delegate_registration_call(data: Json<UserAddr>) -> &'static str {
    match delegate_registration_helper(data).await{
        Ok(_) => "Success",
        Err(_) => "failure"
    }
}

async fn delegate_registration_helper(data: Json<UserAddr>)-> Result<String,Error>{
    let start_time = SystemTime::now();
    println!("Starting delegate registration");

    let (pk_x, pk_y) = get_log_data().await?;
    let pk = get_pk(pk_x.clone(), pk_y.clone())?;
    let token_bal = get_token_bal(data.addr.clone()).await?;

    /* Encrypt balance */
    let ct = bjj_ah_elgamal::encrypt(&token_bal, &pk, &BigInt::from_str("0").unwrap());

    let c_e_x =  bjj_ah_elgamal::point_x_str(&ct.0.affine());
    let c_e_y =  bjj_ah_elgamal::point_y_str(&ct.0.affine());
    let c_v_x =  bjj_ah_elgamal::point_x_str(&ct.1.affine());
    let c_v_y =  bjj_ah_elgamal::point_y_str(&ct.1.affine());
    
    // println!("PK_x:{}", pk_x);
    // println!("PK_y:{}", pk_y);
    // println!("Token Bal:{}", token_bal as u128);
    // println!("CE_x:{}",  c_e_x);
    // println!("CE_y:{}",  c_e_y);
    // println!("CV_x:{}",  c_v_x);
    // println!("CV_y:{}",  c_v_y);

    /* Create toml for prover */
    let toml_value = toml::toml!{
        pk_x= pk_x
        pk_y = pk_y
        msg = token_bal
        random_state = "0"
        c_e_x = (c_e_x.clone())
        c_e_y = (c_e_y.clone())
        c_v_x = (c_v_x.clone())
        c_v_y = (c_v_y.clone())
    };
    
    /* Generate proof  */
    let mut file = File::create("/Users/pillicruz-dejesus/gov_private_bravo/privatevotingzkproofs-main/R_enc/Prover.toml").expect("Failed to create file");
    file.write_all(toml::to_string(&toml_value).unwrap().as_bytes()).expect("Failed to write to file");
    
    println!("Beginning proof generation...");
    let proof_start_time = start_time.elapsed()?.as_secs();
    
    let _ = Command::new("nargo").args(["prove"]).current_dir("/Users/pillicruz-dejesus/gov_private_bravo/privatevotingzkproofs-main/R_enc")
    .output().expect("failed to execute process");
   
    println!("Proof generation completed. Took {} seconds", start_time.elapsed()?.as_secs()-proof_start_time);

    let proof = std::fs::read_to_string("/Users/pillicruz-dejesus/gov_private_bravo/privatevotingzkproofs-main/R_enc/proofs/R_enc.proof")?;
    
    
    /* Delegate on chain */
    println!("Beginning on chain registration...");
    let onchain_start_time = start_time.elapsed().expect("SystemTime elapsed failed").as_secs();
    delegate_onchain(token_bal, data.addr.clone(), c_e_x, c_e_y, c_v_x, c_v_y, proof).await?;
    println!("On chain registration completed. Took {} seconds", start_time.elapsed()?.as_secs()-onchain_start_time);
    
    println!("Completed after {} seconds", start_time.elapsed()?.as_secs());

    return Ok("true".to_string());
}

async fn delegate_onchain(
    token_bal: u32,
    addr: String, 
    c_e_x: String, 
    c_e_y: String, 
    c_v_x: String, 
    c_v_y: String, 
    proof_str: String, 
                            ) -> Result<bool,Error> {

    let hex_bal = format!("{:x}", token_bal);
    let zeros_needed = 64 - hex_bal.to_string().len();
    let hex_token_bal = "0".repeat(zeros_needed) + &hex_bal.to_string();

    let provider = Provider::<Http>::try_from("http://localhost:8545")?.with_sender(addr.parse::<Address>()?);
    
    let client = Arc::new(provider);
    // GOV::
    let contract = GOV::new(GOV_ADDRESS.parse::<Address>()?, client.clone());
    println!("Contract: {:?}",contract.register_delegate(<[u8; 32]>::from_hex(hex_token_bal)?, 
    <[u8; 32]>::from_hex(&c_e_x[2..])?, 
    <[u8; 32]>::from_hex(&c_e_y[2..])?, 
    <[u8; 32]>::from_hex(&c_v_x[2..])?, 
    <[u8; 32]>::from_hex(&c_v_y[2..])?, 
    Bytes::from_hex(proof_str)?).send().await);
    Ok(true)
}

#[get("/setup_delegates")]
pub async fn setup_delegates() -> &'static str {
    match setup_delegates_helper().await{
        Ok(_) => "Success",
        Err(_) => "failure"
    }
}

pub async fn setup_delegates_helper() -> Result<String,Error> {
    let sleep_duration = Duration::from_secs(1);
    thread::sleep(sleep_duration);

    let delegates = ["0x9965507D1a55bcC2695C58ba16FB37d819B0A4dc", "0x976EA74026E726554dB657fA54763abd0C3a0aa9", "0x14dC79964da2C08b23698B3D3cc7Ca32193d9955",
    "0x23618e81E3f5cdF7f54C3d65f7FBc0aBf5B21E8f", "0xa0Ee7A142d267C1f36714E4a8F75612F20a79720", "0xBcd4042DE499D14e55001CcbB24a551F3b954096",
    "0x71bE63f3384f5fb98995898A86B02Fb2426c5788", "0xFABB0ac9d68B0B445fB7357272Ff202C5651694a", "0x1CBd3b2770909D4e10f157cABC84C7264073C9Ec",
    "0xdF3e18d64BC6A983f673Ab319CCaE4f1a57C7097", "0xcd3B766CCDd6AE721141F452C550Ca635964ce71", "0x2546BcD3c84621e976D8185a91A922aE77ECEc30", 
    "0xbDA5747bFD65F08deb54cb465eB87D40e51B197E", "0xdD2FD4581271e230360230F9337D5c0430Bf44C0", "0x8626f6940E2eb28930eFb4CeF49B2d1F2C9C1199", 
    "0x09DB0a93B389bEF724429898f539AEB7ac2Dd55f", "0x02484cb50AAC86Eae85610D6f4Bf026f30f6627D", "0x08135Da0A343E492FA2d4282F2AE34c6c5CC1BbE", 
    "0x5E661B79FE2D3F6cE70F5AAC07d8Cd9abb2743F1"];

    let (pk_x, pk_y) = get_log_data().await?;
    let pk = get_pk(pk_x.clone(), pk_y.clone())?;
    let token_bal = get_token_bal(delegates[0].to_owned()).await?;

    // encrypt balance
    let ct = bjj_ah_elgamal::encrypt(&token_bal, &pk, &BigInt::from_str("0").unwrap());

    let c_e_x =  bjj_ah_elgamal::point_x_str(&ct.0.affine());
    let c_e_y =  bjj_ah_elgamal::point_y_str(&ct.0.affine());
    let c_v_x =  bjj_ah_elgamal::point_x_str(&ct.1.affine());
    let c_v_y =  bjj_ah_elgamal::point_y_str(&ct.1.affine());

    let toml_value = toml::toml!{
        pk_x= pk_x
        pk_y = pk_y
        msg = token_bal
        random_state = "0"
        c_e_x = (c_e_x.clone())
        c_e_y = (c_e_y.clone())
        c_v_x = (c_v_x.clone())
        c_v_y = (c_v_y.clone())
    };
    

    let mut file = File::create("/Users/pillicruz-dejesus/gov_private_bravo/privatevotingzkproofs-main/R_enc/Prover.toml").expect("Failed to create file");
    file.write_all(toml::to_string(&toml_value).unwrap().as_bytes()).expect("Failed to write to file");

    let _ = Command::new("nargo").args(["prove"]).current_dir("/Users/pillicruz-dejesus/gov_private_bravo/privatevotingzkproofs-main/R_enc")
    .output().expect("failed to execute process");

    let proof = std::fs::read_to_string("/Users/pillicruz-dejesus/gov_private_bravo/privatevotingzkproofs-main/R_enc/proofs/R_enc.proof")?;

    for delegate in delegates{
        println!("Registering {} as delegate", delegate);
        delegate_onchain(token_bal, delegate.to_owned(), c_e_x.clone(), c_e_y.clone(), c_v_x.clone(), c_v_y.clone(), proof.clone()).await?;
    }

    return Ok("Success".to_string());
}
