use crate::merklehelper;
use crate::utils::util::{transform_ct_arr, transform_delegates, transform_hash_path_del, transform_rand};
use babyjubjub_rs::Point;
use ethers::providers::Middleware;
use ethers::types::Bytes;
use itertools::Itertools;  // itertools = "0.10"
use num_bigint::BigInt;
use rocket::serde::json::Json;
use rocket::serde::{Deserialize, Serialize};
use std::process::Command;
use std::collections::HashMap;
use std::fs::File;
use hex::{FromHex, encode};
use rand::seq::SliceRandom;
use rand::rngs::OsRng;
use ark_crypto_primitives::Error;
use std::sync::Arc;
use ethers::{
        contract::{Abigen,abigen},
    core::types::{Address, Filter, U256},
    providers::{Http, Provider},
    utils::format_units,
};
//use ethers_contract_abigen::Abigen;

use std::io::Write;
use toml;
use poseidon_rs::Fr;
use ff::PrimeField;
use crate::constants::{GOV_ADDRESS, TOKEN_CONTRACT_ADDRESS};
use crate::util::{get_indexes, get_ld, get_log_data, get_pk, get_token_bal, pad_hex, u832_to_pointprojective, write_to_file, StoredCtVec};
use crate::bjj_ah_elgamal;
use std::u128;
use std::thread;
use std::time::{Duration, SystemTime};

#[derive(Serialize, Deserialize)]
pub struct Delegate {
    // Define your structure to deserialize the data
    user_addr: String,
    delegate_addr: String,
    anoymity_size: u128,
}

#[options("/delegate")]
pub fn options_delegate() -> &'static str {
    "OK"
}


#[post("/delegate", format = "json", data = "<data>")]
pub async fn delegate_call(data: Json<Delegate>) -> &'static str {
    match delegate_helper(data).await{
        Ok(_) => "Success",
        Err(_) => "failure"
    }
}


async fn delegate_helper(data: Json<Delegate>)-> Result<String,Error>{
    let start_time = SystemTime::now();
    println!("Starting delegation...");
    let anonymity_size = data.anoymity_size as usize;
    let (pk_x, pk_y) = get_log_data().await?;
    let pk = get_pk(pk_x.clone(), pk_y.clone())?;
    let token_bal = get_token_bal(data.user_addr.clone()).await?;

    /* get shuffled cts in the size of the anonymity set*/
    let (shuffled_cts, shuffled_indices, mut delegates, shuffled_arr_size, delegate_index_offchain) = get_shuffled_arrs(&data).await?;

    /* add vector cts */
    let (mut ct_1_vec, mut ct_2_vec, mut res_vec,mut rand_vec) = add_vecs(shuffled_cts, delegate_index_offchain,token_bal,&pk)?;   
    
    /* pad everything to size of anonymity set */
    if shuffled_arr_size < anonymity_size {
        let padding_amount = anonymity_size-shuffled_arr_size;
        let hex_string = format!("0x{:0<64}", "");
        let zeros = [hex_string.clone(),hex_string.clone(),hex_string.clone(),hex_string.clone()];

        for _ in 0..padding_amount{
            ct_2_vec.push(zeros.clone());
            ct_1_vec.push(zeros.clone());
            res_vec.push(zeros.clone());
            rand_vec.push(BigInt::from(0));
            delegates.push("0x0000000000000000000000000000000000000000".parse::<Address>()?);
        }
    }

    /* save this info to be used for undelegation */
    let d = StoredCtVec {
        data: ct_2_vec.clone(),
        indices: shuffled_indices.iter().map(|i| i.as_u128()).collect(),
    };
    write_to_file("./ct_vec_old",&d)?;

    /* Populate toml file woth prover data */
    let ct_random_states_str: Vec<String> = rand_vec.iter().map(|rand| pad_hex(&rand.to_str_radix(16))).collect();
    let ct_1_strings: Vec<String> = ct_1_vec.clone().into_iter().flat_map(|arr| arr.into_iter().map(|c| if c.starts_with("0x") {c.to_string()} else {"0x".to_owned()+&c})).collect();
    let ct_2_strings: Vec<String> = ct_2_vec.clone().into_iter().flat_map(|arr| arr.into_iter()).collect();
    let res_strings: Vec<String> = res_vec.clone().into_iter().flat_map(|arr| arr.into_iter()).collect();
    let delegates_strings: Vec<String> = delegates.clone().iter().map(|delegate| pad_hex(&format!("{:x}",delegate))).collect();
    let (rt,rt_path, user_index) = get_rt(data.user_addr.clone()).await?;
    let rt_str = rt.to_string();
    let rt_path_strings: Vec<String> = rt_path.clone().iter().map(|fr| (&fr.to_string()[3..&fr.to_string().len()-1]).to_string()).collect();
    let addr = pad_hex(&data.delegate_addr.clone());
    let t_v = pad_hex(&format!("{:x}",token_bal));
    let vote_idx = pad_hex(&format!("{:x}",user_index));
    let vote_root = &rt_str[3..rt_str.len()-1];

    let toml_value = toml::toml!{
        delegate_addr = addr
        t_v = t_v
        pk_enc_x = (pk_x.clone())
        pk_enc_y = (pk_y.clone())
        cts = (ct_2_strings.clone())
        ct_random_states = (ct_random_states_str.clone())
        delegates = (delegates_strings.clone())
        vote_hashpath = (rt_path_strings.clone())
        vote_idx = (vote_idx.clone())
        vote_root = (vote_root.clone())
        summand = (ct_1_strings.clone())
        sum = (res_strings.clone())
    };

    /* define path based on anonymity size */
    let mut path = "privatevotingzkproofs/".to_string();
    if anonymity_size == 20 {path = path + "r_delvecadd";}
    else if anonymity_size == 10 {path = path + "R_del10";}
    else if anonymity_size == 5 {path = path + "R_del5";}
    let mut proof_path = path.clone();
    if anonymity_size == 20 {proof_path = proof_path + "/proofs/r_delvecadd.proof";}
    else if anonymity_size == 10 {proof_path = proof_path + "/proofs/r_del10.proof";}
    else if anonymity_size == 5 {proof_path = proof_path + "/proofs/r_del5.proof";}


    /* generate proof */
    let mut file = File::create(path.clone() +"/Prover.toml").expect("Failed to create file");
    file.write_all(toml::to_string(&toml_value).unwrap().as_bytes())
        .expect("Failed to write to file");

    println!("Beginning proof generation...");
    let proof_start_time = start_time.elapsed()?.as_secs();    
    Command::new("nargo").args(["prove"]).current_dir(path.clone())
    .output().expect("failed to execute process");
    println!("Proof generation completed. Took {} seconds", start_time.elapsed()?.as_secs()-proof_start_time);

    let proof = std::fs::read_to_string(proof_path)?;
    
    /* delegate onchain */
    println!("Beginning on chain delegation...");
    let onchain_start_time = start_time.elapsed()?.as_secs();
    delegate_onchain(data, ct_2_vec, rand_vec, delegates, rt, rt_path, user_index, ct_1_vec, res_vec, shuffled_indices, proof).await?;
    println!("On chain delegation completed. Took {} seconds", start_time.elapsed()?.as_secs()-onchain_start_time);
    println!("Completed: {}",start_time.elapsed().expect("SystemTime elapsed failed").as_secs());
    return Ok("true".to_string());
}


async fn delegate_onchain(
    data: Json<Delegate>,
    ct_2_vec: Vec<[String; 4]>, 
    rand_vec: Vec<BigInt>, 
    delegates: Vec<Address>,
    rt: Fr,
    rt_path: Vec<Fr>,
    user_index: u32,
    ct_1_vec: Vec<[String; 4]>, 
    res_vec: Vec<[String; 4]>, 
    shuffled_indices: Vec<U256>,
    proof_str: String) -> Result<bool,Error> {
    
    abigen!(
        Gov,"../../backend/rust_web_server/src/abi/GovernorBravoDelegate.json";
    );
    let provider = Provider::<Http>::try_from("http://foundry:8545")?.with_sender(data.user_addr.parse::<Address>()?);
    let client = Arc::new(provider);
    let contract = Gov::new(GOV_ADDRESS.parse::<Address>()?, client.clone());
    
    let ct_2_onchain = transform_ct_arr(ct_2_vec)?;    
    let rand_onchain = transform_rand(rand_vec)?;
    let delegates_onchain = transform_delegates(delegates)?; 
    let hash_path_onchain = transform_hash_path_del(rt_path)?;
    let ct_1_onchain = transform_ct_arr(ct_1_vec)?;
    let ct_res_onchain = transform_ct_arr(res_vec)?;
    let rt_onchain = <[u8; 32]>::from_hex(&rt.to_string()[5..rt.to_string().len()-1])?;
    let index_onchain = <[u8; 32]>::from_hex(&pad_hex(&format!("{:x}",user_index))[2..])?;

    println!("{:?}",contract.delegate(
        ct_2_onchain,
        rand_onchain, 
        delegates_onchain, 
        rt_onchain,
        hash_path_onchain, 
        index_onchain, 
        ct_1_onchain,
        ct_res_onchain, 
        shuffled_indices,
        Bytes::from_hex(proof_str)?).send().await);
    
    /* uncomment to see log */
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
    //     println!("Successfully Delegated found {} logs", logs.len());
    // }
    Ok(true)
}

/* get all token transfer balance create lt, use this to get merkle root, merkle path, and user index in merkle tree*/ 
async fn get_rt(user_addr: String) -> Result<(poseidon_rs::Fr, Vec<poseidon_rs::Fr>, u32),Error> {
    /* setup connection to onchain contract and get transfer logs */
    // let provider = Provider::<Http>::try_from("http://foundry:8545")?;
    let provider = Provider::<Http>::try_from("http://foundry:8545")?;

    let client = Arc::new(provider);
    let filter = Filter::new()
        .address(TOKEN_CONTRACT_ADDRESS.parse::<Address>()?)
        .event("Transfer(address,address,uint256)")
        .from_block(0);
    let logs = client.get_logs(&filter).await?;
    let mut index: usize = 0;

    let mut lt_addr_to_index: HashMap<Address, usize> = HashMap::new();
    let mut lt: HashMap<Address, U256> = HashMap::new();

    /* loop through logs for token balances */
    for log in logs.iter() {
        let from = Address::from(log.topics[1]);
        let to = Address::from(log.topics[2]);
        let amount = U256::from_big_endian(&log.data);
        if from == "0x0000000000000000000000000000000000000000".parse::<Address>()?{
            lt.insert(to, amount);
            lt_addr_to_index.insert(to,index);
            index+=1

        }else{
            if let Some(balance) = lt.get_mut(&from) {
                if *balance >= amount {
                    *balance -= amount;
                } else {
                }
            } else {
            }
            if let Some(balance) = lt.get_mut(&to) {
                    *balance += amount;
            } else {
                lt.insert(to, amount);
                lt_addr_to_index.insert(to,index);
                index+=1
                
            }
        }  
    }
    /*create merkle tree */
    let mut leaves: Vec<Vec<poseidon_rs::Fr>> = Vec::new();
    for (k, _) in lt_addr_to_index.iter().sorted_by_key(|x| x.1) {
        let token_bal_ethers_with_decimal = format_units(lt[k].to_string().parse::<u128>()?, "ether").unwrap();
        let token_bal_float = token_bal_ethers_with_decimal.parse::<f64>()?;
        let token_bal = token_bal_float as u128;
        leaves.push(vec![(Fr::from_str(&token_bal.to_string()).unwrap())]);
    }

    let user_index = lt_addr_to_index[&user_addr.parse::<Address>()?] as u32;
    /* get merkle info */
    let (rt,hashpath) = merklehelper::gen_proof_padded(&leaves, 20, user_index).unwrap();

    return Ok((rt,hashpath,user_index));
}


/* shuffled_cts: is a random order of delegate cts in the size of anonymity set which includes our target delegates 
shuffled_indices: onchain indices for the given delegate i.e where in ld they should go in same order of shuffled_cts
delegates: vec of delegate addresses in same order of shuffled_cts
shuffled_arr_size: size of arr which may be different than anonymity set i.e. 19 delegates anonymity set 20
delegate_index_ofchain: the index of the user being delegate to in shuffled_cts
*/
async fn get_shuffled_arrs(data: &Json<Delegate>) -> Result<(Vec<[[u8; 32]; 4]>,Vec<U256>,Vec<Address>, usize, usize),Error>{
    let anonymity_size = data.anoymity_size as usize;
    let ct_1_vec_u8 = get_ld().await?;
    let shuffled_arr_size = if anonymity_size > ct_1_vec_u8.len() {ct_1_vec_u8.len()} else {anonymity_size};
    let indexes = get_indexes().await?;
    let mut shuffled_addresses: Vec<Address> = indexes.keys().cloned().collect();
    let mut rng = OsRng;
    shuffled_addresses.shuffle(&mut rng);

    let mut delegates: Vec<Address> = Vec::new();
    delegates.push(data.delegate_addr.parse::<Address>()?);
    let mut i = 0;
    while delegates.len() < shuffled_arr_size{
        if data.delegate_addr.parse::<Address>()? != shuffled_addresses[i]{
            delegates.push(shuffled_addresses[i])
        }
        i+=1;
    }

    let mut rng = OsRng;
    delegates.shuffle(&mut rng);
    
    let mut delegate_index_offchain = 0;
    /*the on chain index for this slot */
    let mut shuffled_indices: Vec<U256> = Vec::new();
    for (i,addr) in delegates.iter().enumerate(){
        if addr == &data.delegate_addr.parse::<Address>()?{
            delegate_index_offchain = i;
        }
        shuffled_indices.push(indexes[&addr])
    }

    let mut shuffled_cts: Vec<[[u8; 32]; 4]> = Vec::new();
    for index in shuffled_indices.iter(){
        shuffled_cts.push(ct_1_vec_u8[index.as_usize()]);
    }
    let delegate_index_onchain = indexes[&data.delegate_addr.parse::<Address>()?];
    println!("delegate_index: {:?}", delegate_index_onchain);
    Ok((shuffled_cts, shuffled_indices, delegates, shuffled_arr_size,delegate_index_offchain))
}

fn add_vecs(shuffled_cts: Vec<[[u8; 32]; 4]>, 
    delegate_index_offchain: usize, 
    token_bal: u32, 
    pk: &Point)
    -> Result<(Vec<[String; 4]>,Vec<[String; 4]>,Vec<[String; 4],>,Vec<BigInt>),Error>{

    let mut ct_1_vec: Vec<[String; 4]> = Vec::new();
    let mut ct_2_vec: Vec<[String; 4]> = Vec::new();
    let mut res_vec: Vec<[String; 4]> = Vec::new();
    let mut rand_vec: Vec<BigInt> = Vec::new();
    
    /* encrypt 0 for every delegate except for target delegate we encrypt our 
    token bal. Also same randomness for each encryption then adds encryptions*/
    for (index, c1_arr) in shuffled_cts.iter().enumerate() {
        let arr_1 = [encode(c1_arr[0]), encode(c1_arr[1]), encode(c1_arr[2]), encode(c1_arr[3])];
        ct_1_vec.push(arr_1);
        let (c1_e,c1_v) = u832_to_pointprojective(c1_arr)?;
        
        let randomness = bjj_ah_elgamal::gen_rand_bigint();
        let (mut c2_e, mut c2_v) = bjj_ah_elgamal::encrypt(&0, &pk, &randomness);
        if index == delegate_index_offchain  {
            (c2_e,c2_v) = bjj_ah_elgamal::encrypt(&token_bal, &pk, &randomness);
        }
        rand_vec.push(randomness);
        let cex_2 = bjj_ah_elgamal::point_x_str(&c2_e.affine());
        let cey_2 = bjj_ah_elgamal::point_y_str(&c2_e.affine());
        let cvx_2 = bjj_ah_elgamal::point_x_str(&c2_v.affine());
        let cvy_2 = bjj_ah_elgamal::point_y_str(&c2_v.affine());
        let arr_2 = [cex_2,cey_2,cvx_2,cvy_2];
        ct_2_vec.push(arr_2);

        let (res_e, res_v) = bjj_ah_elgamal::add_encryptions(&vec![(c2_e.clone(), c2_v.clone()),(c1_e.clone(), c1_v.clone())]);

        let resex = bjj_ah_elgamal::point_x_str(&res_e.affine());
        let resey = bjj_ah_elgamal::point_y_str(&res_e.affine());
        let resvx = bjj_ah_elgamal::point_x_str(&res_v.affine());
        let resvy = bjj_ah_elgamal::point_y_str(&res_v.affine());

        let arr_res = [resex,resey,resvx,resvy];
        res_vec.push(arr_res)
    } 
    Ok((ct_1_vec,ct_2_vec,res_vec,rand_vec))
}



