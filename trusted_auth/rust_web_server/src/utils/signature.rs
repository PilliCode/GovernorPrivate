use blst::*;
use rand::RngCore;

pub fn print_hello(){
  println!("Hello from Signature.rs!");
}

pub fn gen_sk() -> min_pk::SecretKey {
  let mut rng = rand::thread_rng();
  let mut ikm: [u8; 32] = [0u8; 32];
  rng.fill_bytes(&mut ikm);

  let sk = min_pk::SecretKey::key_gen(&ikm, &[]).unwrap(); 
  return sk;
}

pub fn pk_from_sk(sk: &min_pk::SecretKey) -> min_pk::PublicKey {
  return sk.sk_to_pk();
}

pub fn sign(msg: &[u8], dst: &[u8], sk: &min_pk::SecretKey) -> min_pk::Signature {
  return sk.sign(msg, dst, &[]);
}

pub fn verify(sig: min_pk::Signature, msg: &[u8], dst: &[u8], pk: &min_pk::PublicKey) -> bool {
  let result: BLST_ERROR = sig.verify(true, msg, dst, &[], &pk, true);
  if result == BLST_ERROR::BLST_SUCCESS {
    return true;
  }
  return false;
}