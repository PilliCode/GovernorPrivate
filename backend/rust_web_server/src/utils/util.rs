use ark_crypto_primitives::Error;
use ethers::types::BigEndianHash;
use ethers::{
        contract::{Abigen,abigen},
    core::types::{Address, Filter, U256},
    providers::{Http, Middleware, Provider},
    utils::format_units
};
//use ethers_contract_abigen::Abigen;

use num_bigint::BigInt;
use std::{collections::HashMap, sync::Arc};
use crate::constants::{DEFAULT_USER, GOV_ADDRESS, TOKEN_CONTRACT_ADDRESS};
use ethers::abi::AbiEncode;
use poseidon_rs::Fr;
use babyjubjub_rs::{Point, PointProjective};
use ff::PrimeField;
use hex::{FromHex, encode};
use std::fs::File;
use std::io::{self, Read};
use std::path::Path;
use serde::{Serialize, Deserialize};


#[derive(Serialize, Deserialize, Debug)]
pub struct StoredCtVec {
    pub(crate) data: Vec<[String; 4]>,
    pub(crate) indices: Vec<u128>,

}

/* Check emit log to see if initialize was emitted*/
pub async fn get_log_data() -> Result<(String,String),Error> {
    // let provider = Provider::<Http>::try_from("http://foundry:8545")?.with_sender(DEFAULT_USER.parse::<Address>()?);
    let provider = Provider::<Http>::try_from("http://foundry:8545")?.with_sender(DEFAULT_USER.parse::<Address>()?);
    let client = Arc::new(provider);

    let filter = Filter::new()
        .address(GOV_ADDRESS.parse::<Address>()?)
        .event("InitializePrivate(bytes32,bytes32,bytes32,string,string)")
        .from_block(0);
    let logs = client.get_logs(&filter).await?;
    let pk_x = logs[0].topics[1].encode_hex();
    let pk_y = logs[0].topics[2].encode_hex();
    return Ok((pk_x,pk_y));
}
/* converts two hex strings to a point */
pub fn get_pk(pk_x: String, pk_y: String) -> Result<Point,Error>{
    let pk_x_decimal = &pk_x[2..].parse::<U256>()?;
    let pk_y_decimal = &pk_y[2..].parse::<U256>()?;
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
    Ok(pk)
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
    Ok(ct)
}
/* get users token balance */
pub async fn get_token_bal(addr: String) -> Result<u32,Error> {
    abigen!(
        TokenContract,"../../backend/rust_web_server/src/abi/PrivateToken.json";
    );
    // let provider = Provider::<Http>::try_from("http://foundry:8545")?.with_sender(addr.parse::<Address>()?);
    let provider = Provider::<Http>::try_from("http://foundry:8545")?.with_sender(addr.parse::<Address>()?);
    let client = Arc::new(provider);
    let contract = TokenContract::new(TOKEN_CONTRACT_ADDRESS.parse::<Address>()?, client.clone());
    let bal = contract.balance_of(addr.parse::<Address>()?).call().await?;

    let token_bal_ethers_with_decimal = format_units(bal.to_string().parse::<u128>()?, "ether").unwrap();
    let token_bal_float = token_bal_ethers_with_decimal.parse::<f64>()?;
    let token_bal = token_bal_float as u32;
    return Ok(token_bal);
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

/* get ld off chain */
pub async fn get_ld()  -> Result<Vec<[[u8; 32]; 4]>,Error> {
    abigen!(
        Gov,"../../backend/rust_web_server/src/abi/GovernorBravoDelegate.json";
    );
    // let provider = Provider::<Http>::try_from("http://foundry:8545")?.with_sender(DEFAULT_USER.parse::<Address>()?);    
    let provider = Provider::<Http>::try_from("http://foundry:8545")?.with_sender(DEFAULT_USER.parse::<Address>()?);    
    let client = Arc::new(provider);
    
    let contract = Gov::new(GOV_ADDRESS.parse::<Address>()?, client.clone());
    let res = contract.get_ld().call().await?;
    // println!("Delegates found: {:?}", res.len());
    Ok(res)
}

/*Create map of Ld indexes Find all RegisterDelegate emits and create a map from address to index with that*/
pub async fn get_indexes() -> Result<HashMap<Address, U256>,Error> {

    let mut ld: HashMap<Address, U256> = HashMap::new();
    
    // let provider = Provider::<Http>::try_from("http://foundry:8545")?;
    let provider = Provider::<Http>::try_from("http://foundry:8545")?;
    let client = Arc::new(provider);
    let filter = Filter::new()
        .address(GOV_ADDRESS.parse::<Address>()?)
        .event("RegisterDelegate(address,uint256,bool,bool,uint256)")
        .from_block(0);
    let logs = client.get_logs(&filter).await?;
    for log in logs.iter() {
        let addr = Address::from(log.topics[1]);
        let index = log.topics[2].into_uint();
        ld.insert(addr, index);
    }
    // Uncomment to make sure all addresses are found
    // for (addr, index) in &ld {
    //     println!("Address: {}, index: {}", addr, index);
    // }
    return Ok(ld);
}

/* gets the 4 currents cts for a given delegate */
pub async fn get_ct(addr: &str) -> Result<(PointProjective,PointProjective),Error> {
    // let provider = Provider::<Http>::try_from("http://foundry:8545")?.with_sender(DEFAULT_USER.parse::<Address>()?);
    let provider = Provider::<Http>::try_from("http://foundry:8545")?.with_sender(DEFAULT_USER.parse::<Address>()?);
    let client = Arc::new(provider);
    abigen!(
        Gov,"../../backend/rust_web_server/src/abi/GovernorBravoDelegate.json";
    );
    let contract = Gov::new(GOV_ADDRESS.parse::<Address>()?, client.clone());
    let ct = contract.get_ciphertext(addr.parse::<Address>()?).call().await?;
    let ce = Point {
        x: Fr::from_str(
            &encode(ct.0).parse::<U256>()?.to_string(),
        )
        .unwrap(),
        y: Fr::from_str(
            &encode(ct.1).parse::<U256>()?.to_string(),
        )
        .unwrap(),
    };
    let cv = Point {
        x: Fr::from_str(
            &encode(ct.2).parse::<U256>()?.to_string(),
        )
        .unwrap(),
        y: Fr::from_str(
            &encode(ct.3).parse::<U256>()?.to_string(),
        )
        .unwrap(),
    };
    let ct = (ce.projective(),cv.projective());
    Ok(ct)
}


pub fn write_to_file<P: AsRef<Path>>(path: P, data: &StoredCtVec) -> io::Result<()> {
    let file = File::create(path)?;
    serde_json::to_writer(file, data)?;
    Ok(())
}

pub fn read_from_file<P: AsRef<Path>>(path: P) -> io::Result<StoredCtVec> {
    let mut file = File::open(path)?;
    let mut contents = String::new();
    file.read_to_string(&mut contents)?;
    let data: StoredCtVec = serde_json::from_str(&contents)?;
    Ok(data)
}

pub fn transform_hash_path(data: Vec<Fr>) -> Result<[[u8;32];20],Error> {
    let mut ct_onchain: [[u8;32];20] = Default::default();
    let mut index = 0;
    for subpath in data.iter(){
        let subpath_str = subpath.to_string();
        ct_onchain[index] = <[u8; 32]>::from_hex(&subpath_str[5..subpath_str.len()-1])?;
        index+=1;
    }
    Ok(ct_onchain)
}

pub fn transform_ct_arr(data: Vec<[String; 4]>) -> Result<Vec<[u8;32]>,Error> {
    let mut ct_onchain: Vec<[u8;32]> = Vec::new();
    for ct_arr in data.iter(){
        for ct in ct_arr.iter() {
            if ct.starts_with("0x") {
                ct_onchain.push(<[u8; 32]>::from_hex(&ct[2..])?);
            }else{
                ct_onchain.push(<[u8; 32]>::from_hex(&ct)?);
            }
        }
    }
    Ok(ct_onchain)
}

pub fn transform_rand(data: Vec<BigInt>) -> Result<Vec<[u8;32]>,Error> {
    let mut ct_onchain: Vec<[u8;32]> = Vec::new();
    for rand in data.iter(){
        ct_onchain.push(<[u8; 32]>::from_hex(&pad_hex(&rand.to_str_radix(16))[2..])?);
    }
    Ok(ct_onchain)
}

pub fn transform_delegates(data: Vec<Address>) -> Result<Vec<[u8;32]>,Error> {
    let mut ct_onchain: Vec<[u8;32]> = Vec::new();
    for delegate in data.iter(){
        ct_onchain.push(<[u8; 32]>::from_hex(&pad_hex(&format!("{:x}",delegate))[2..])?);
    }
    Ok(ct_onchain)
}

pub fn transform_hash_path_del(data: Vec<Fr>) -> Result<Vec<[u8;32]>,Error> {
    let mut ct_onchain: Vec<[u8;32]> = Vec::new();
    for subpath in data.iter(){
        let subpath_str = subpath.to_string();
        ct_onchain.push(<[u8; 32]>::from_hex(&subpath_str[5..subpath_str.len()-1])?);
    }
    Ok(ct_onchain)
}


pub fn strings_to_pointprojective(arr: &[String;4]) -> Result<(PointProjective,PointProjective),Error> {
    let mut cex_decimal: U256 = U256::from(0);
    let mut cey_decimal: U256 = U256::from(0);
    let mut cvx_decimal: U256 = U256::from(0);
    let mut cvy_decimal: U256 = U256::from(0);

    if arr[0].starts_with("0x"){
        cex_decimal = arr[0][2..].parse::<U256>()?;
        cey_decimal = arr[1][2..].parse::<U256>()?;
        cvx_decimal = arr[2][2..].parse::<U256>()?;
        cvy_decimal = arr[3][2..].parse::<U256>()?;    
    }else{
        cex_decimal = arr[0].parse::<U256>()?;
        cey_decimal = arr[1].parse::<U256>()?;
        cvx_decimal = arr[2].parse::<U256>()?;
        cvy_decimal = arr[3].parse::<U256>()?;    
    }


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

pub fn transform_vec_str_to_arr_u832(vec: Vec<String>) -> Result<Vec<[u8;32]>,Error>{
    let mut res: Vec<[u8;32]> = Vec::new();
    for str in vec{
        if str.starts_with("0x") {
            res.push(<[u8; 32]>::from_hex(&str[2..])?);
        }else{
            res.push(<[u8; 32]>::from_hex(&str)?);
        }
    }
    Ok(res)
}
