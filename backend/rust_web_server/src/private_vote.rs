use crate::merklehelper;
use crate::utils::util::strings_to_pointprojective;
use babyjubjub_rs::PointProjective;
use ethers::providers::Middleware;
use ethers::types::{Bytes, H256};
use rocket::serde::json::Json;
use rocket::serde::{Deserialize, Serialize};
use std::io::Write;
use std::process::Command;
use toml;
use std::time::SystemTime;
use std::sync::Arc;
use std::fs::File;
use hex::{FromHex, encode};
use ark_crypto_primitives::Error;

use ethers::{
    contract::{Abigen,abigen},
    core::types::{Address, U256,Filter},
    providers::{Http, Provider},
};
// //use ethers_contract_abigen::Abigen;


use poseidon_rs::Fr;
use ff::PrimeField;

use crate::constants::GOV_ADDRESS;
use crate::util::{get_indexes, pad_hex, transform_hash_path, u832_to_pointprojective};
use crate::bjj_ah_elgamal;
use std::u128;


#[derive(Serialize, Deserialize)]
pub struct Vote {
    user_addr: String,
    id: u128, //proposalid
    vote: u8, //for is 0, no is 1, abstain is 2
    message: String,
}


#[options("/private_vote")]
pub fn options_private_vote() -> &'static str {
    "OK"
}

#[post("/private_vote", format = "json", data = "<data>")]
pub async fn private_vote_call(data: Json<Vote>) -> &'static str {
    match private_vote_helper(data).await{
        Ok(_) => "Success",
        Err(_) => "failure"
    }
}


async fn private_vote_helper(data: Json<Vote>)-> Result<String,Error>{
    let start_time = SystemTime::now();
    println!("Starting vote...");

    /* get proposal counts */
    let orig_votes = get_proposal_votes(&data).await?;

    /* get merkle root and info */
    let (hashpath, root, my_vote, leaf_index) = get_proof_ld(&data).await?;
    
    /* add my vote encryption */
    let res_vote = bjj_ah_elgamal::add_encryptions(&vec![orig_votes.clone(),my_vote.clone()]);

    let hashpath_strings: Vec<String> = hashpath.clone().iter().map(|fr| (&fr.to_string()[3..&fr.to_string().len()-1]).to_string()).collect();
    
    let mt_idx = pad_hex(&format!("{:x}",leaf_index));

    /* create toml for prover */
    let toml_value = toml::toml!{
        e1x = (bjj_ah_elgamal::point_x_str(&orig_votes.0.affine()))
        e1y = (bjj_ah_elgamal::point_y_str(&orig_votes.0.affine()))
        v1x = (bjj_ah_elgamal::point_x_str(&orig_votes.1.affine()))
        v1y = (bjj_ah_elgamal::point_y_str(&orig_votes.1.affine()))
        e2x = (bjj_ah_elgamal::point_x_str(&my_vote.0.affine()))
        e2y = (bjj_ah_elgamal::point_y_str(&my_vote.0.affine()))
        v2x = (bjj_ah_elgamal::point_x_str(&my_vote.1.affine()))
        v2y =  (bjj_ah_elgamal::point_y_str(&my_vote.1.affine()))
        e_resx = (bjj_ah_elgamal::point_x_str(&res_vote.0.affine()))
        e_resy = (bjj_ah_elgamal::point_y_str(&res_vote.0.affine()))
        v_resx = (bjj_ah_elgamal::point_x_str(&res_vote.1.affine()))
        v_resy = (bjj_ah_elgamal::point_y_str(&res_vote.1.affine()))
        mt_root = (root.clone())
        mt_hashpath = hashpath_strings
        mt_idx =  mt_idx
    };

    /* generate proof */
    let mut file = File::create("privatevotingzkproofs/R_add/Prover.toml").expect("Failed to create file");
    file.write_all(toml::to_string(&toml_value).unwrap().as_bytes())
        .expect("Failed to write to file");
    let proof_start_time = start_time.elapsed()?.as_secs();

    println!("Beginning proof generation...");
    
    Command::new("nargo").args(["prove"]).current_dir("privatevotingzkproofs/R_add")
    .output().expect("failed to execute process");
    
    println!("Proof generation completed. Took {} seconds", start_time.elapsed()?.as_secs()-proof_start_time);
    let proof = std::fs::read_to_string("privatevotingzkproofs/R_add/proofs/R_add.proof")?;
    let r_add = create_radd(orig_votes,my_vote,res_vote)?;

    /* vote on chain */
    let onchain_start_time = start_time.elapsed()?.as_secs();
    println!("Beginning on chain vote...");
    vote_onchain(data, r_add, root, hashpath,leaf_index ,proof).await?;
    println!("On chain vote completed. Took {} seconds", start_time.elapsed()?.as_secs()-onchain_start_time);

    println!("Completed: {}",start_time.elapsed().expect("SystemTime elapsed failed").as_secs());
    return Ok("true".to_string());
}

async fn vote_onchain(data: Json<Vote>, r_add: [[u8; 32]; 12], root: String, hashpath: Vec<Fr>, leaf_index: u32, proof: String) -> Result<String,Error>{
    abigen!(
        Gov,"../../backend/rust_web_server/src/abi/GovernorBravoDelegate.json";
    );
    // let provider = Provider::<Http>::try_from("http://foundry:8545")?.with_sender(data.user_addr.parse::<Address>()?);
    let provider = Provider::<Http>::try_from("http://foundry:8545")?.with_sender(data.user_addr.parse::<Address>()?);
    let client = Arc::new(provider);
    let contract = Gov::new(GOV_ADDRESS.parse::<Address>()?, client.clone());    
    let hash_path_onchain = transform_hash_path(hashpath)?;
    let leaf_onchain = <[u8; 32]>::from_hex(&pad_hex(&format!("{:x}",leaf_index))[2..])?;

    match contract.vote(
        U256::from(data.id.clone()),        // proposalid
        data.vote.clone(),        // vote
        data.message.clone(),        // message
        r_add,        // have an array of 12 for the first part for R_add leaf is 4-7 inclusive
        <[u8; 32]>::from_hex(&root[2..])?,        // root bytes32
        hash_path_onchain,        // path bytes32 20
        leaf_onchain,        // index bytes32
        Bytes::from_hex(proof)?).send().await {
        Ok(result) => {
            println!("Function call succeeded, result: {:?}", result);
        },
        Err(error) => {
                println!("Function call reverted, reason: {:?}", error);
                return Err(Box::new(error))
        }
    }
    return Ok("true".to_string());

}

fn create_radd(
    orig_votes: (PointProjective,PointProjective),
    my_vote: (PointProjective,PointProjective),
    res_vote: (PointProjective,PointProjective)) -> Result<[[u8;32];12],Error>{
    let mut ct_onchain: [[u8;32];12] = [[0;32];12];
    // println!("ex1: {:?}",<[u8; 32]>::from_hex(&bjj_ah_elgamal::point_x_str(&origVotes.0.affine())[2..]));
    ct_onchain[0] = <[u8; 32]>::from_hex(&bjj_ah_elgamal::point_x_str(&orig_votes.0.affine())[2..])?;
    ct_onchain[1] = <[u8; 32]>::from_hex(&bjj_ah_elgamal::point_y_str(&orig_votes.0.affine())[2..])?;
    ct_onchain[2] = <[u8; 32]>::from_hex(&bjj_ah_elgamal::point_x_str(&orig_votes.1.affine())[2..])?;
    ct_onchain[3] = <[u8; 32]>::from_hex(&bjj_ah_elgamal::point_y_str(&orig_votes.1.affine())[2..])?;

    ct_onchain[4] = <[u8; 32]>::from_hex(&bjj_ah_elgamal::point_x_str(&my_vote.0.affine())[2..])?;
    ct_onchain[5] = <[u8; 32]>::from_hex(&bjj_ah_elgamal::point_y_str(&my_vote.0.affine())[2..])?;
    ct_onchain[6] = <[u8; 32]>::from_hex(&bjj_ah_elgamal::point_x_str(&my_vote.1.affine())[2..])?;
    ct_onchain[7] = <[u8; 32]>::from_hex(&bjj_ah_elgamal::point_y_str(&my_vote.1.affine())[2..])?;

    ct_onchain[8] = <[u8; 32]>::from_hex(&bjj_ah_elgamal::point_x_str(&res_vote.0.affine())[2..])?;
    ct_onchain[9] = <[u8; 32]>::from_hex(&bjj_ah_elgamal::point_y_str(&res_vote.0.affine())[2..])?;
    ct_onchain[10] = <[u8; 32]>::from_hex(&bjj_ah_elgamal::point_x_str(&res_vote.1.affine())[2..])?;
    ct_onchain[11] = <[u8; 32]>::from_hex(&bjj_ah_elgamal::point_y_str(&res_vote.1.affine())[2..])?;

    Ok(ct_onchain)
}

async fn get_proposal_votes(data: &Json<Vote>) -> Result<(PointProjective,PointProjective),Error> {
    abigen!(
        Gov,"../../backend/rust_web_server/src/abi/GovernorBravoDelegate.json";
    );
    // let provider = Provider::<Http>::try_from("http://:8545")?.with_sender(data.user_addr.parse::<Address>()?);
    let provider = Provider::<Http>::try_from("http://foundry:8545")?.with_sender(data.user_addr.parse::<Address>()?);
    let client = Arc::new(provider);
    let contract = Gov::new(GOV_ADDRESS.parse::<Address>()?, client.clone());

    let proposal_votes = contract.get_proposal_votes(
        U256::from(data.vote.clone()),
        U256::from(data.id.clone()),
    ).call().await?;
    // println!("proposal votes: {:?}", proposal_votes);
    let ct = u832_to_pointprojective(&proposal_votes)?;
    // println!("ct: {:?}", ct);
    Ok(ct)    
}

async fn get_ld_snapshot(data: &Json<Vote>) -> Result<Vec<[String;4]>,Error>{
    // all we need is to get emit log from election_start and that will be our ct
    // let provider = Provider::<Http>::try_from("http://foundry:8545")?.with_sender(data.user_addr.parse::<Address>()?);
    let provider = Provider::<Http>::try_from("http://foundry:8545")?.with_sender(data.user_addr.parse::<Address>()?);
    let client = Arc::new(provider);

    /* get election start log for this proposal because emitted cs is there */
    let filter = Filter::new()
    .address(GOV_ADDRESS.parse::<Address>()?)
    .topic0("0x96aec36079bdd98acd3d106b267644df627cb82734e07a6d41b405f46658c77f".parse::<H256>()?)
    .topic1(U256::from(data.id.clone()))
    .from_block(0);
    let logs = client.get_logs(&filter).await?;
    let mut cts: Vec<[String;4]> = Vec::new();
    
    if logs.len() >= 1 {
        let log = &logs[0];
        let length = log.data.to_string().len();
        let mut i: usize = 130;
        while i < length {
            let mut arr: [String;4] = Default::default();
            for j in 0..4{
                arr[j] = log.data.to_string()[i..i+64].to_string();
                i+=64;
            }
            cts.push(arr);
        }

    }
    Ok(cts)
}


async fn get_proof_ld(data: &Json<Vote>) -> Result<(Vec<Fr>,String,(PointProjective,PointProjective),u32),Error> {
    // let provider = Provider::<Http>::try_from("http://foundry:8545")?.with_sender(data.user_addr.parse::<Address>()?);    
    // let client = Arc::new(provider);
    // let contract = GOV::new(GOV_ADDRESS.parse::<Address>()?, client.clone());
    // let ld_vec = contract.get_ld().call().await?;

    let ld_vec = get_ld_snapshot(data).await?;
    
    let indexes = get_indexes().await?;
    if !indexes.contains_key(&data.user_addr.parse::<Address>()?){
        println!("User is not a delegate");
        return Err(Box::<dyn ark_std::error::Error>::from("User is not a delegate".to_string()))
    }
    let merkle_index = indexes[&data.user_addr.parse::<Address>()?].as_u32();
    // println!("Delegate Index {:?}", merkle_index);

    let mut leaves: Vec<Vec<poseidon_rs::Fr>> = Vec::new();
    let mut leaf: Option<(PointProjective,PointProjective)> = None;
    for (idx, cts) in ld_vec.clone().iter().enumerate() {
        if (idx as u32) == merkle_index{
            leaf = Some(strings_to_pointprojective(&cts.clone())?);
        }
        // let ct0 = (Fr::from_str(&U256::from_str_radix(&encode(cts[0]),16)?.to_string()).unwrap());
        // let ct1 = (Fr::from_str(&U256::from_str_radix(&encode(cts[1]),16)?.to_string()).unwrap());
        // let ct2 = (Fr::from_str(&U256::from_str_radix(&encode(cts[2]),16)?.to_string()).unwrap());
        // let ct3 = (Fr::from_str(&U256::from_str_radix(&encode(cts[3]),16)?.to_string()).unwrap());
        let ct1 = Fr::from_str(&U256::from_str_radix(&cts[1],16)?.to_string()).unwrap();
        let ct0 = Fr::from_str(&U256::from_str_radix(&cts[0],16)?.to_string()).unwrap();
        let ct2 = Fr::from_str(&U256::from_str_radix(&cts[2],16)?.to_string()).unwrap();
        let ct3 = Fr::from_str(&U256::from_str_radix(&cts[3],16)?.to_string()).unwrap();
        leaves.push(vec![ct0,ct1,ct2,ct3]);

        // leaves.push(vec![(Fr::from_str(&encode(cts[0])).unwrap()),(Fr::from_str(&encode(cts[1])).unwrap()),(Fr::from_str(&encode(cts[2])).unwrap()),(Fr::from_str(&encode(cts[3])).unwrap())]);
    }
    let (rt,proof) = merklehelper::gen_proof_padded(&leaves, 20, merkle_index).unwrap();
    let rt_str = rt.to_string();
    let rt_cut = rt_str[3..rt_str.len()-1].to_string();

    return Ok((proof,rt_cut,leaf.unwrap(),merkle_index));
}


