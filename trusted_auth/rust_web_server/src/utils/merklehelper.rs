use core::num;

use ff::PrimeField;
use poseidon_rs::{Fr, Poseidon};
use num_bigint::{BigInt, RandBigInt, Sign, ToBigInt};

//use crate::hash;
// #[derive(Debug, Clone)]
// pub struct TrieNode {
//   val: Option<[u8; 32]>,  // the actual enk... should probably be [u8; 32]
//   hash: [u8; 32],
//   left: Option<TrieNodeRef>,
//   right: Option<TrieNodeRef>,
// }

// type TrieNodeRef = Rc<RefCell<TrieNode>>;

// calculate the hashes, return (root, hashpath)
// pub fn gen_proof_naive(input: &Vec<Fr>, hashpath_len: usize, target_idx: u32) -> Option<(Fr, Vec<Fr>)> {
//     let hasher = poseidon_rs::Poseidon::new();
//     let input_len = input.len();
//     let target_num_leaves = u32::pow(2, hashpath_len as u32) as usize;

//     if input_len > target_num_leaves {
//         // throw an error
//         return None; //Err("Invalid Hashpath Length");  // can't make a hashpath this small for the input data
//     }

//     // instead, make a subtree of 0's. Easy to compute that root, since it's
//     // symmetric. 
//     //let leaves = input.copy();
//     let mut leaves = input.to_owned();
//     leaves.extend(vec![Fr::from_str("0").unwrap(); target_num_leaves - input_len]);
//     println!("{}", leaves.len());

//     // first, hash all the leaves. Should this be of type Fr?
//     let mut cur = vec![Fr::from_str("0").unwrap(); leaves.len()];
//     for i in 0..leaves.len() {
//         cur[i] = hasher.hash(vec![leaves[i]]).unwrap();
//     }
    
//     let mut hashpath = vec![Fr::from_str("0").unwrap(); hashpath_len];
//     let mut level_pos = target_idx;

//     for h_i in 0..hashpath_len {
//         if level_pos % 2 == 0 {
//             hashpath[h_i] = cur[(level_pos + 1) as usize];
//         } else {
//             hashpath[h_i] = cur[(level_pos - 1) as usize];
//         }
//         let mut new_leaves = vec![Fr::from_str("0").unwrap(); cur.len() / 2];
//         for (i, l) in cur.chunks(2).enumerate() {
//             new_leaves[i] = hasher.hash(vec![l[0], l[1]]).unwrap();
//         }
//         cur = new_leaves;
//         level_pos /= 2;
//         println!("level: {}", h_i);
//     }

//     return Some((cur[0], hashpath));
// }


fn merkleize(target_idx: u32, leaves: &Vec<Fr>, hashpath: &mut Vec<Fr>, height: u32, hasher: &Poseidon) -> Fr {
    let mut level_pos = target_idx;

    let mut cur = leaves.clone();
    for h_i in 0..(height as usize) {
        if level_pos % 2 == 0 {
            hashpath.push(cur[(level_pos + 1) as usize]);
        } else {
            hashpath.push(cur[(level_pos - 1) as usize]);
        }
        //let mut new_leaves = vec![Fr::from_str("0").unwrap(); cur.len() / 2];
        let mut new_leaves: Vec<Fr> = Vec::new();
        for (i, l) in cur.chunks(2).enumerate() {
            new_leaves.push(hasher.hash(vec![l[0], l[1]]).unwrap());
        }
        cur = new_leaves;
        level_pos /= 2;
        //println!("level: {}", h_i);
    }
    return cur[0];
}

fn root_zero_tree(height: usize, hasher: &Poseidon) -> Fr {
    let mut root = hasher.hash(vec![Fr::from_str("0").unwrap()]).unwrap();
    for i in 0..height {
        root = hasher.hash(vec![root, root]).unwrap();
    }
    return root
}

pub fn gen_proof_padded(input: &Vec<Vec<Fr>>, hashpath_len: usize, target_idx: u32) -> Option<(Fr, Vec<Fr>)> {
    let hasher = poseidon_rs::Poseidon::new();
    let input_len = input.len();
    let target_num_leaves = u32::pow(2, hashpath_len as u32) as usize;

    if input_len > target_num_leaves {
        // throw an error
        return None; //Err("Invalid Hashpath Length");  // can't make a hashpath this small for the input data
    }

    // Create subtree of provided values, T
    let t_path_len = (input_len as f32).log2().ceil() as u32;
    let pad_len = (2_u32.pow(t_path_len)) - input_len as u32;
    let mut leaves = input.to_owned();
    leaves.extend(vec![vec![Fr::from_str("0").unwrap()]; pad_len as usize]);
    println!("{}", leaves.len());

    // Hash T up to T_root. We start by hashing each of the values.

    // update: now hashes arbitrary leaves (size >= 1)
    let mut cur: Vec<Fr> = Vec::new();
    for i in 0..leaves.len() {
        let t = &leaves[i];
        cur.push(hasher.hash(leaves[i].clone()).unwrap());
    }
    let mut hashpath: Vec<Fr> = Vec::new();

    let t_root = merkleize(target_idx, &cur, &mut hashpath, t_path_len, &hasher);
    
    //println!("T_root: {}", t_root);

    if t_path_len == hashpath_len as u32 {
        return Some((t_root, hashpath));
    }

    // then, keep hashing t_root with the growing 0 subtree until we get our
    // desired result.

    // first, create the corresponding 0 tree.
    let mut z_root = root_zero_tree(t_path_len as usize, &hasher);

    let num_iters = hashpath_len - t_path_len as usize;
    let mut root = t_root.clone();
    for _ in 0..num_iters {
        root = hasher.hash(vec![root, z_root]).unwrap();
        hashpath.push(z_root);
        z_root = hasher.hash(vec![z_root, z_root]).unwrap();
    }

    return Some((root, hashpath));
}

// fn u8_array_to_bool_array(input: [u8; 32]) -> [bool; 256] {
//   let mut output = [false; 256];
//   for (i, &byte) in input.iter().enumerate() {
//       for bit in 0..8 {
//           output[i * 8 + bit] = (byte & (1 << bit)) != 0;
//       }
//   }
//   return output;
// }

// fn bool_array_to_u8_array(input: [bool; 256]) -> [u8; 32] {
//   let mut output = [0u8; 32];
//   for (i, &bit) in input.iter().enumerate() {
//       if bit {
//           let byte_index = i / 8;
//           let bit_index = i % 8;
//           output[byte_index] |= 1 << bit_index;
//       }
//   }
//   return output;
// }


// fn insert_leaf(root: TrieNodeRef, bits: [bool; 256], i: u32) {
//   if i == 256 {
//     // we're at the leaf, no more bits to account for
//     root.val = Some(bool_array_to_u8_array(bits));
//   }
//   else if bits[i] == 0 {
//     if root.left == None {
//       // not quite this easy... see https://github.com/anupj/Data-Structures-in-Rust/blob/main/binary_tree/tree_height/src/lib.rs
//       root.left = TrieNode{val: None, hash: None, left: None, right: None};
//     }
//     insert_leaf(root.left)
//   }
// }

// // insert the leaves, then call merkleize
// pub fn build_trie(l: Vec<[u8; 32]>) {

//   let root = TrieNode{val: None, hash: None, left: None, right: None};

//   for enk_i in l.iter() {
//     // insert it

//   }
// }