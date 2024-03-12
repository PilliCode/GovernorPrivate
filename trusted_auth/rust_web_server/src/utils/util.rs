use ark_crypto_primitives::Error;
use ethers::{
        contract::{Abigen,abigen},
    core::types::{Address, Filter, U256},
    providers::{Http, Middleware, Provider},
};
//use ethers_contract_abigen::Abigen;

use std::{collections::HashMap, sync::Arc};
use crate::utils::constants::{DEFAULT_USER, GOV_ADDRESS, TOKEN_CONTRACT_ADDRESS};
use ethers::abi::AbiEncode;
use poseidon_rs::Fr;
use babyjubjub_rs::{Point, PointProjective};
use ff::PrimeField;
use hex::encode;
use crate::bjj_ah_elgamal;
use crate::merklehelper;

use std::fs:: File;
use std::io::{self, Read};
use std::path::Path;
use serde::{Serialize, Deserialize};
use itertools::Itertools;  // itertools = "0.10"

#[derive(Serialize, Deserialize, Debug)]
pub struct StoredSk {
    pub(crate) sk: u128,
}


pub async fn get_log_data() -> Result<(String,String),Error> {
    // let provider = Provider::<Http>::try_from("http://foundry:8545")?.with_sender(DEFAULT_USER.parse::<Address>()?);
    let provider = Provider::<Http>::try_from("http://foundry:8545")?.with_sender(DEFAULT_USER.parse::<Address>()?);
    let client = Arc::new(provider);

    // Check emit log to see if initialize was emitted
    let filter = Filter::new()
        .address(GOV_ADDRESS.parse::<Address>()?)
        .event("InitializePrivate(bytes32,bytes32,bytes32,string,string)")
        .from_block(0);
    let logs = client.get_logs(&filter).await?;
    // println!("Found {} logs", logs.len());
    let pk_x = logs[0].topics[1].encode_hex();
    let pk_y = logs[0].topics[2].encode_hex();
    return Ok((pk_x,pk_y));
}

/*gets merkle root and hashpath for token balances, loops through all transfer emit logs */
pub async fn get_rt() -> Result<(poseidon_rs::Fr, Vec<poseidon_rs::Fr>),Error> {
    // IDEA create index as we search, since we are looping through logs in order should give us static indexes for token balance
    let mut lt_addr_to_index: HashMap<Address, usize> = HashMap::new();
    let mut lt: HashMap<Address, U256> = HashMap::new();

    // let provider = Provider::<Http>::try_from("http://foundry:8545")?;
    let provider = Provider::<Http>::try_from("http://foundry:8545")?;
    let client = Arc::new(provider);
    let filter = Filter::new()
        .address(TOKEN_CONTRACT_ADDRESS.parse::<Address>()?)
        .event("Transfer(address,address,uint256)")
        .from_block(0);
    let logs = client.get_logs(&filter).await?;
    // println!("{} logs found!", logs.iter().len());
    let mut index: usize = 0;
    for log in logs.iter() {
        let from = Address::from(log.topics[1]);
        let to = Address::from(log.topics[2]);
        let amount = U256::from_big_endian(&log.data);
        // println!("from: {}, to: {}, amount:{}", from, to, amount);
        if from == "0x0000000000000000000000000000000000000000".parse::<Address>()?{
            lt.insert(to, amount);
            lt_addr_to_index.insert(to,index);
            index+=1

        }else{
            if let Some(balance) = lt.get_mut(&from) {
                // Subtract the specified amount
                if *balance >= amount {
                    *balance -= amount;
                    // println!("address:{}, balance:{}", from, *balance);
                } else {
                    // println!("Insufficient balance to subtract");
                }
            } else {
                // println!("Address not found in the map");
            }

            if let Some(balance) = lt.get_mut(&to) {
             // add the specified amount
                    *balance += amount;
                    // println!("address:{}, balance:{}", from, *balance);

            } else {
                lt.insert(to, amount);
                lt_addr_to_index.insert(to,index);
                index+=1
                
            }
        }
       
    }
    // test make sure lt output correct
    // for (address, balance) in &lt {
    //     println!("Address: {}, Balance: {}", address, format_units(balance.to_string().parse::<u128>()?, "ether").unwrap());
    // }
    let mut leaves: Vec<Vec<poseidon_rs::Fr>> = Vec::new();
    for (k, v) in lt_addr_to_index.iter().sorted_by_key(|x| x.1) {
        println!("addr={}, index={}, bal={}", k, v, lt[k]);
        leaves.push(vec![(Fr::from_str(&lt[k].to_string()).unwrap())]);
    }
    // for (index, (address, balance)) in lt.iter().enumerate() {
    //     lt_addr_to_index.insert(*address, index);
    // }
    let (rt,hashpath) = merklehelper::gen_proof_padded(&leaves, 20, 1).unwrap();

    return Ok((rt,hashpath));
}


pub fn get_pk(pk_x: String, pk_y: String) -> Result<Point,Error>{

    // println!("PK_x: {:?}, PK_y: {} ",&pk_x[2..], pk_y);

    let pk_x_decimal = &pk_x[2..].parse::<U256>()?;
    let pk_y_decimal = &pk_y[2..].parse::<U256>()?;

    // println!("x_decimal: {:?}, y_decimal: {:?}", pk_x_decimal,pk_y_decimal);

    let pk = Point {
        x: Fr::from_str(
            &pk_x_decimal.to_string(),

        )
        .unwrap(),
        y: Fr::from_str(
            &pk_y_decimal.to_string(),
        )
        .unwrap(),
    };
    // println!("PK_x: {}, " ,pk.x, );
    // println!("PK_y: {}, " , pk.y, );
    return Ok(pk)
}

pub fn u832_to_pointprojective(arr: &[[u8; 32]; 4]) -> Result<(PointProjective,PointProjective),Error> {
    let ce = Point {
        x: Fr::from_str(
            &encode(arr[0]).parse::<U256>()?.to_string(),
        )
        .unwrap(),
        y: Fr::from_str(
            &encode(arr[1]).parse::<U256>()?.to_string(),
        )
        .unwrap(),
    };

    let cv = Point {
        x: Fr::from_str(
            &encode(arr[2]).parse::<U256>()?.to_string(),
        )
        .unwrap(),
        y: Fr::from_str(
            &encode(arr[3]).parse::<U256>()?.to_string(),
        )
        .unwrap(),
    };
    let ct = (ce.projective(),cv.projective());

    // let c_e_x =  bjj_ah_elgamal::point_x_str(&ct.0.affine());
    // let c_e_y =  bjj_ah_elgamal::point_y_str(&ct.0.affine());
    // let c_v_x =  bjj_ah_elgamal::point_x_str(&ct.1.affine());
    // let c_v_y =  bjj_ah_elgamal::point_y_str(&ct.1.affine());
    
    // println!("OLD CE_x: {}",  c_e_x);
    // println!("OLD CE_y: {}",  c_e_y);
    // println!("OLD CV_x: {}",  c_v_x);
    // println!("OLD CV_y: {}",  c_v_y);

    Ok(ct)
}

/*Assumes starts with 0x and pads it inbetween 0x and number*/
pub fn pad_hex(hex: &str) -> String {
    let mut hex_part = hex;
    if hex.starts_with("0x") {
        hex_part = &hex[2..]; // Get the part after "0x"
    }
    let padding_length = 64 - hex_part.len(); // Calculate padding length
    format!("0x{}{}", "0".repeat(padding_length), hex_part)
}

/* writes sk to file */
pub fn write_to_file<P: AsRef<Path>>(path: P, data: &StoredSk) -> io::Result<()> {
    let file = File::create(path)?;
    serde_json::to_writer(file, data)?;
    Ok(())
}

/*reads sk from file */
pub fn read_from_file<P: AsRef<Path>>(path: P) -> io::Result<StoredSk> {
    let mut file = File::open(path)?;
    let mut contents = String::new();
    file.read_to_string(&mut contents)?;
    let data: StoredSk = serde_json::from_str(&contents)?;
    Ok(data)
}

/*converts from array of 4 hex strings to a Point Projective */
pub fn strings_to_pointprojective(arr: &[String;4]) -> Result<(PointProjective,PointProjective),Error> {
    let cex_decimal = &arr[0][2..].parse::<U256>()?;
    let cey_decimal = &arr[1][2..].parse::<U256>()?;
    let cvx_decimal = &arr[2][2..].parse::<U256>()?;
    let cvy_decimal = &arr[3][2..].parse::<U256>()?;


    let ce = Point {
        x: Fr::from_str(&cex_decimal.to_string()).unwrap(),
        y: Fr::from_str(&cey_decimal.to_string()).unwrap(),
    };

    let cv = Point {
        x: Fr::from_str(&cvx_decimal.to_string()).unwrap(),
        y: Fr::from_str(&cvy_decimal.to_string()).unwrap(),
    };
    let ct = (ce.projective(),cv.projective());
    Ok(ct)

}

/* consolidates 3 point projectives into Vec of strings*/
pub fn create_cts(for_votes: (PointProjective, PointProjective), against_votes: (PointProjective, PointProjective), abstain_votes: (PointProjective, PointProjective)) -> Vec<String>{
    let cex_for = bjj_ah_elgamal::point_x_str(&for_votes.0.affine());
    let cey_for = bjj_ah_elgamal::point_y_str(&for_votes.0.affine());
    let cvx_for = bjj_ah_elgamal::point_x_str(&for_votes.1.affine());
    let cvy_for = bjj_ah_elgamal::point_y_str(&for_votes.1.affine());
    let cex_against = bjj_ah_elgamal::point_x_str(&against_votes.0.affine());
    let cey_against = bjj_ah_elgamal::point_y_str(&against_votes.0.affine());
    let cvx_against = bjj_ah_elgamal::point_x_str(&against_votes.1.affine());
    let cvy_against = bjj_ah_elgamal::point_y_str(&against_votes.1.affine());
    let cex_abstain = bjj_ah_elgamal::point_x_str(&abstain_votes.0.affine());
    let cey_abstain = bjj_ah_elgamal::point_y_str(&abstain_votes.0.affine());
    let cvx_abstain = bjj_ah_elgamal::point_x_str(&abstain_votes.1.affine());
    let cvy_abstain = bjj_ah_elgamal::point_y_str(&abstain_votes.1.affine());
    
    vec![cex_for,cey_for,cvx_for,cvy_for,cex_against,cey_against,cvx_against,cvy_against,cex_abstain,cey_abstain,cvx_abstain,cvy_abstain]
}