use ethers::types::Bytes;
use rocket::serde::json::Json;
use rocket::serde::{Deserialize, Serialize};
use std::io::Write;
use std::process::Command;
use std::sync::Arc;
use std::fs::File;
use hex::{encode, FromHex};
use ark_crypto_primitives::Error;
use ethers::{
        contract::{Abigen,abigen},
    core::types::{Address, U256},
    providers::{Http, Provider},
};
//use ethers_contract_abigen::Abigen;

use crate::constants::{GOV_ADDRESS, FOUNDRY_IP};
use crate::util::{get_ld, read_from_file, strings_to_pointprojective, transform_vec_str_to_arr_u832, u832_to_pointprojective};
use crate::bjj_ah_elgamal;
use std::u128;
use std::time::SystemTime;

#[derive(Serialize, Deserialize)]
pub struct User {
    user_addr: String,
}

#[options("/undelegate")]
pub fn options_undelegate() -> &'static str {
    "OK"
}


#[post("/undelegate", format = "json", data = "<data>")]
pub async fn undelegate_call(data: Json<User>) -> &'static str {
    match undelegate_helper(data).await{
        Ok(_) => "Success",
        Err(_) => "failure"
    }
}

async fn undelegate_helper(data: Json<User>)-> Result<String,Error>{
    let start_time = SystemTime::now();

    /* Read saved vector and indices we used to delegate */
    let read_data = read_from_file("./ct_vec_old")?;
    let ct_old_vec = read_data.data;

    /* anonymity size is same as size of vector created during
     delegation all delegates 0 except the one we delegated to */
    let anonymity_size = ct_old_vec.len();
    let indices = read_data.indices;

    /* create ct_new_vec which grabs delegates at indices from delegation */
    let all_onchain_cts = get_ld().await?;
    let mut ct_new_vec_u8: Vec<[[u8; 32]; 4]> = Vec::new();
    for index in indices.iter(){
        ct_new_vec_u8.push(all_onchain_cts[*index as usize]);
    }

    let mut ct_new_vec_flat: Vec<String> = Vec::new();
    let mut res_vec_flat: Vec<String> = Vec::new();

    /* do subtraction for delegate new-old */
    for (index, c_new_arr) in ct_new_vec_u8.iter().enumerate() {

        let new_elems = vec!["0x".to_owned()+&encode(c_new_arr[0]), "0x".to_owned()+&encode(c_new_arr[1]), "0x".to_owned()+&encode(c_new_arr[2]), "0x".to_owned()+&encode(c_new_arr[3])];
        ct_new_vec_flat.extend(new_elems);
        
        let (ce_new,cv_new) = u832_to_pointprojective(c_new_arr)?;

        let (ce_old, cv_old) = strings_to_pointprojective(&ct_old_vec[index])?;

        // sub is new - old 
        let (res_e, res_v) = bjj_ah_elgamal::subtract_encryptions((ce_new.clone(), cv_new.clone()),(ce_old.clone(), cv_old.clone()));

        let resex = bjj_ah_elgamal::point_x_str(&res_e.affine());
        let resey = bjj_ah_elgamal::point_y_str(&res_e.affine());
        let resvx = bjj_ah_elgamal::point_x_str(&res_v.affine());
        let resvy = bjj_ah_elgamal::point_y_str(&res_v.affine());

        let arr_res = vec![resex,resey,resvx,resvy];
        res_vec_flat.extend(arr_res);
    }    
 
    /* flatten ct old vec */
    let mut ct_old_vec_flat: Vec<String> = ct_old_vec.clone().into_iter().flat_map(|arr| arr.into_iter()).collect();

    /*this pads if we have less delegates than anonymity set size 
    ex. 19 delegates anonymity size is 20*/
    if ct_new_vec_flat.len() < ct_old_vec_flat.len() {
        let padding_amount = ct_old_vec_flat.len()-ct_new_vec_flat.len();
        let hex_string = format!("0x{:0<64}", "");
        for _ in 0..padding_amount{
            ct_new_vec_flat.push(hex_string.clone());
            res_vec_flat.push(hex_string.clone());
        }
    }
    /*if we have anonymity size 5 or 10 this pads everything to size of 20*/
    if ct_old_vec_flat.len() < 80{
        let padding_amount = 80 - ct_old_vec_flat.len();
        let hex_string = format!("0x{:0<64}", "");
        for _ in 0..padding_amount{
            ct_new_vec_flat.push(hex_string.clone());
            res_vec_flat.push(hex_string.clone());
            ct_old_vec_flat.push(hex_string.clone());
        }
    }

    /* create toml for prover */
    let toml_value = toml::toml!{
        summand1 = (ct_new_vec_flat.clone())
        summand2 = (ct_old_vec_flat.clone())
        sum = (res_vec_flat.clone())
    };

    /* Generate proof */
    println!("Beginning proof generation...");
    let proof_start_time = start_time.elapsed()?.as_secs();
    let mut file = File::create("privatevotingzkproofs/R_vecsub/Prover.toml").expect("Failed to create file");
    file.write_all(toml::to_string(&toml_value).unwrap().as_bytes())
        .expect("Failed to write to file");
    
    println!("Proof generation completed. Took {} seconds", start_time.elapsed()?.as_secs()-proof_start_time);
    
    Command::new("nargo").args(["prove"]).current_dir("privatevotingzkproofs/R_vecsub")
    .output().expect("failed to execute process");
    let proof = std::fs::read_to_string("privatevotingzkproofs/R_vecsub/proofs/R_vecsub.proof")?;
   
    /* UnDelegate on chain */
    println!("Beginning on chain registration...");
    let onchain_start_time = start_time.elapsed().expect("SystemTime elapsed failed").as_secs();
    
    undelegate_onchain(data, ct_new_vec_flat,ct_old_vec_flat,res_vec_flat,indices, anonymity_size, proof).await?;
    
    println!("On chain undelegation completed. Took {} seconds", start_time.elapsed()?.as_secs()-onchain_start_time);

    println!("Completed after {} seconds", start_time.elapsed()?.as_secs());

    return Ok("true".to_string());
}

async fn undelegate_onchain(
    data: Json<User>,
    ct_new_vec: Vec<String>, 
    ct_old_vec: Vec<String>, 
    res_vec: Vec<String>,
    indices: Vec<u128>,
    anonymity_size: usize,
    proof_str: String) -> Result<bool,Error> {

    abigen!(
        Gov,"../../backend/rust_web_server/src/abi/GovernorBravoDelegate.json";
    );
    // let provider = Provider::<Http>::try_from("http://10.112.63.19:8545")?.with_sender(data.user_addr.parse::<Address>()?);
    let provider = Provider::<Http>::try_from(FOUNDRY_IP)?.with_sender(data.user_addr.parse::<Address>()?);
    let client = Arc::new(provider);
    let contract = Gov::new(GOV_ADDRESS.parse::<Address>()?, client.clone());

    /* transform vecs for onchain consumption */
    let ct_new_onchain = transform_vec_str_to_arr_u832(ct_new_vec)?;
    let ct_old_onchain = transform_vec_str_to_arr_u832(ct_old_vec)?;
    let res_onchain = transform_vec_str_to_arr_u832(res_vec)?;
    let indices_onchain = indices.iter().map(|i| U256::from(*i)).collect();

    println!("{:?}",contract.undelegate(
        ct_new_onchain,
        ct_old_onchain,
        res_onchain,
        indices_onchain,
        U256::from(anonymity_size),
        Bytes::from_hex(proof_str)?,
    ).send().await);
    
    // let sleep_duration = Duration::from_secs(1);
    // thread::sleep(sleep_duration);

    // let filter = Filter::new()
    // .address(GOV_ADDRESS.parse::<Address>()?)
    // .event("Delegated(address,bytes32,bool)")
    // .topic1(data.user_addr.parse::<Address>()?)
    // .from_block(0);
    // let logs = client.get_logs(&filter).await?;
    // println!("logs: {}", logs.len());
    // if logs.len() >= 1 {
    //     println!("Successfully undelegated found {} logs", logs.len());
    // }
    Ok(true)
}



