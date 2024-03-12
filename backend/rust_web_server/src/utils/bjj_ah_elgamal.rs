use babyjubjub_rs::*;
use lazy_static::lazy_static;
use ff::*;
use num_bigint::{BigInt, RandBigInt, Sign, ToBigInt};
use std::fs::{File, OpenOptions};
use std::io::{self, Write};

lazy_static! {
  // generator g
  static ref B8: Point = Point {
    x: Fr::from_str(
        "5299619240641551281634865583518297030282874472190772894086521144482721001553",
    )
    .unwrap(),
    y: Fr::from_str(
        "16950150798460657717958625567821834550301663161624707787222815936182638968203",
    )
    .unwrap(),
  };

  // point at infinity
  static ref O: PointProjective = PointProjective { 
    x: Fr::from_str("0").unwrap(), 
    y: Fr::from_str("1").unwrap(), 
    z: Fr::from_str("0").unwrap() 
  };
}

pub fn print_point(p: &Point, name: &str) {
  println!("{}.x: {}", name, p.x.to_string());
  println!("{}.y: {}", name, p.y.to_string());
}

pub fn print_point_raw(p: &Point) {
    let x = p.x.to_string();
    let y = p.y.to_string();
    print!("\"{}\", \"{}\", ", &x[3..x.len()-1], &y[3..y.len()-1]);
}

pub fn point_x_str(p: &Point) -> String {
    let x = p.x.to_string();
    return x[3..x.len()-1].to_string();
}

pub fn point_y_str(p: &Point) -> String {
    let y = p.y.to_string();
    return y[3..y.len()-1].to_string();
}


pub fn print_point_proj(p: &PointProjective, name: &str) {
    println!("{}.x: {}", name, p.x.to_string());
    println!("{}.y: {}", name, p.y.to_string());
    println!("{}.z: {}", name, p.z.to_string());
}

// adjust range
pub fn gen_rand_bigint () -> BigInt {
  let mut rng = rand::thread_rng();
  let low =  1.to_bigint().unwrap();
  let high = 100_000_000.to_bigint().unwrap();
  return rng.gen_bigint_range(&low, &high);
}

pub fn get_sk () -> BigInt {
  return gen_rand_bigint();
}

pub fn get_point(power: &u32) -> Point {
    return B8.mul_scalar(&BigInt::from_bytes_be(Sign::Plus, &power.to_be_bytes())); 
}

pub fn sk_to_pk (sk: &BigInt) -> Point {
  let r: Point = B8.mul_scalar(sk);
  return r;
}


// implement add-and-double algorithm for multiplication and include prints of all intermediary representations
pub fn verbose_multiply(p: Point, scalar: BigInt) {
    //BJJ: 𝑦^2=𝑥^3+168,698𝑥^2+𝑥

    let target = p.mul_scalar(&scalar);
    print_point(&target, "target");


    let prover_path = "sp_mult.txt";
    let piopts = OpenOptions::new().create(true).append(true).open(prover_path).unwrap();
    // where to save the hints
    let mut proverinfo = io::BufWriter::new(piopts); 

    // add and double implementation
    let (_, bytes) = scalar.to_bytes_be();

    let n_bits = scalar.bits() as usize;

    println!("num scalar bits: {}", n_bits);
    let tot_bits = bytes.len() * 8;

    // O but affine... for some reason, (0,1,0) --> affine was returning (0,0) instead of (0,1)...
    let mut q = Point {x: Fr::from_str("0").unwrap(), y: Fr::from_str("1").unwrap()};

    let mut hint_str = "[".to_string();

    for (byte_idx, byte) in bytes.iter().enumerate() { //.skip(tot_bytes - n_bytes - 1) {
        for bit_idx in 0..8 {
            // skip leading 0's
            if (byte_idx * 8) + bit_idx < tot_bits - n_bits as usize {
                continue;
            } 

            let cur_bit = (byte >> (7-bit_idx)) & 1;

            // double the point
            q = q.mul_scalar(&BigInt::from_bytes_be(Sign::Plus, &2_u32.to_be_bytes()));
            
            if cur_bit == 1 {
                print_point(&p, "p");
                print_point(&q, "cur");

                print_point(&p, "p");
                print_point(&q, "q1");
                // p + q = q
                q = p.projective().add(&q.projective()).affine();

                print_point(&q, "q2");
                print_point(&q, "res");
                //print_point(&q, "q")
                hint_str.push_str(&format!("\"{}\", ", point_x_str(&q)));
                hint_str.push_str(&format!("\"{}\", ", point_y_str(&q)));
            }
            
            //print_point(&q, "cur")
        }
    }

    hint_str = hint_str[0..hint_str.len()-2].to_string();
    hint_str.push_str("]");

    writeln!(proverinfo, "hints = {}", hint_str).unwrap();
}

pub fn encrypt(msg: &u32, pk: &Point, randomness: &BigInt) -> (PointProjective, PointProjective) {
  let adjusted_msg = msg;
  //let beta = gen_rand_bigint(); // randomness
  let beta = randomness;
  let v = B8.mul_scalar(&beta);  // g * sk2 = v
  //let d = O.clone();
  let w = pk.mul_scalar(&beta); // pk * sk2 = g * sk * sk2 = w

  let mut g_m = O.clone();
  if msg > &0 {
    g_m = B8.mul_scalar(&BigInt::from_bytes_be(Sign::Plus, &adjusted_msg.to_be_bytes())).projective();  // put msg on curve
  }
  // if g_m is the point at infinity, then e stays the same.
  let mut e = w.clone().projective();
  if !g_m.z.is_zero() {
    e = w.projective().add(&g_m);
  }

  return (e, v.projective());
}

fn test_equality(p1: &mut Point, p2: &mut Point) -> bool {
  return p1.x.eq(&p2.x) && p1.y.eq(&p2.y);
}

pub fn decrypt(sk: &BigInt, c: (PointProjective, PointProjective)) -> u32 {
  let (e, v) = c;

  println!("sk: {}", sk.to_string());

  let mut g_m: PointProjective = e.clone();
  let mut w = v.affine().mul_scalar(&sk);
  w.x.negate(); // negate point

  g_m = g_m.add(&w.projective());  // add the negation, so subtract w from e

  //let m: u32 = extract_number(&mut g_m);
  let m = discrete_log(&mut g_m);
  //let m = extract_number(&mut g_m);
  println!("m: {}", m);
  return m;
}

pub fn rerandomize(pk: &Point, c: &(PointProjective, PointProjective), r: &BigInt) -> (PointProjective, PointProjective) {

  let (e, v) = c;
  //let r = gen_rand_bigint();

  let g_r = B8.mul_scalar(&r).projective();
  let pk_r = pk.mul_scalar(&r).projective();

  let v_rerand = v.add(&g_r);
  let e_rerand = e.add(&pk_r);
  return (e_rerand, v_rerand)
}

/*
    Discrete log calculates log_g(g^m) = m. As an implementation detail of the encryption scheme, it actually returns m-1.
*/
pub fn discrete_log(g_m: &mut PointProjective) -> u32 {
    // first, check for 0
    // g*0 = O
    if g_m.z.is_zero() {
        return 0;   // if it's the point at infinity -- special case
    }

    let g_m_affine = g_m.affine();
    let q: u32 = 16_192_576;
    //let t = (q as f64).sqrt() as u32;
    let t = 4024;

    let mut ring: Vec<Point> = vec![B8.clone(); (t+1) as usize];    // 0th index is unused.
    for i in 1..(t+1) {
        // g^1, g^t, g^2t, g^3t, ...
        ring[i as usize] = ring[i as usize].mul_scalar(&(t * i).to_bigint().unwrap());
    }

    let mut small_steps: Vec<Point> = vec![B8.clone(); t as usize];
    let mut cur_step: Point = g_m_affine.clone();
    let g: PointProjective = B8.clone().projective();
    small_steps[0] = cur_step.clone();
    for i in 1..t {
        cur_step = cur_step.projective().add(&g).affine();
        small_steps[i as usize] = cur_step.clone();
    }

    // check if smallsteps[i] == ring[j]. The larger the number, the more
    // iterations of the outer loop we have to go to. Can we speed this up?
    for k in 1..(t+1) {
        for i in 0..t{
            if test_equality(&mut ring[k as usize], &mut small_steps[i as usize]) {
                return (k * t) - i;
            }
        }
    } 
    return 0;
}

/*
    Naive discrete log
*/
fn extract_number(g_m: &mut PointProjective) -> u32 {

  let mut m: u32 = 1;
  //let mut cur: Point = B8.mul_scalar(&BigInt::new(Sign::Plus, vec![1]));  // g^1
  let mut cur = B8.clone().projective();
  let g = B8.clone().projective();

  for _ in 1..1_000_000 {
    if test_equality(&mut cur.affine(), &mut g_m.affine()) {
      break;
    }

    cur = cur.add(&g);
    m += 1;
  }

  return m; // -1 to adjust
}

pub fn add_encryptions(cs: &Vec<(PointProjective, PointProjective)>) -> (PointProjective, PointProjective) {
  
  let mut e_sum = cs[0].0.clone();
  let mut v_sum = cs[0].1.clone();
  for (e,v) in cs.iter().skip(1) {
    e_sum = e_sum.add(&e);
    v_sum = v_sum.add(&v);
  }
  return (e_sum, v_sum);
}

pub fn subtract_encryptions(c1: (PointProjective, PointProjective), c2: (PointProjective, PointProjective)) -> (PointProjective, PointProjective) {
    let e1 = c1.0.clone();
    let v1 = c1.1.clone();


    let mut e2_neg = c2.0.clone();
    let mut v2_neg = c2.1.clone();

    // why is it flipping the x coordinate instead of the y coordinate?
    e2_neg.x.negate();  // negate encryption
    v2_neg.x.negate();

    return (e1.add(&e2_neg), v1.add(&v2_neg));
}