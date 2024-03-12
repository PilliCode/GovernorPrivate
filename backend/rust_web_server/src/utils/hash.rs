//use ark_bn254::Fr;
//use ark_bn254::Fr;
use poseidon_rs::Fr;
// use babyjubjub_rs::*;
// use ff::{PrimeField, Field};
use sha2::{Sha256, Digest};
use blst::*;
use ff::PrimeField;
//use ff_ce::PrimeField;

// use arkworks_mimc::MiMC;
// use arkworks_mimc::params::mimc_7_91_bn254::*;
// use arkworks_mimc::params::*;

// use ark_bn254::Fr;
//use ark_crypto_primitives::crh::TwoToOneCRH;
//use ark_ff::{to_bytes, One, Zero};
//global MIMC_BN254_ROUNDS = 91;

pub fn sha256(msg: &[u8]) {
  let mut hasher = Sha256::new();
  hasher.update(msg);
  let _res = hasher.finalize();
}

pub fn hash_to_blst_scalar(hash: &[u8]) -> blst_scalar {
  let mut h_msg = blst_scalar::default();
  unsafe {
      blst_scalar_from_lendian(&mut h_msg, hash.as_ptr());  // perhaps from le_bytes instead
  }
  return h_msg
}

pub fn poseidon() -> Fr {
    let p = poseidon_rs::Poseidon::new();

    let p1 = Fr::from_str("12242166908188651009877250812424843524687801523336557272219921456462821518061").unwrap();
    let mut arr = Vec::new();
    arr.push(p1.clone());

    return p.hash(arr.clone()).unwrap();
}