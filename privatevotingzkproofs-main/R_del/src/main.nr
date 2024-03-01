use dep::std;
use dep::std::hash;
use dep::std::merkle;
use dep::std::ec::consts::te::baby_jubjub;
use dep::std::ec::tecurve::affine::{Curve, Point};
use dep::std::field;

// potential speedup if we hardcode max path_len to constant 20
fn custom_compute_merkle_root(leaf: Field, index: Field, hash_path: [Field; 20]) -> Field {
    // first, ascertain the working length of the path.

    //let n = hash_path.len();
    let n = 20;
    let index_bits = index.to_le_bits(n as u32);
    let mut current = leaf;
    for i in 0..n {
        let path_bit = index_bits[i] as bool;
        let (hash_left, hash_right) = if path_bit {
            (hash_path[i], current)
        } else {
            (current, hash_path[i])
        };
        current = hash::poseidon::bn254::hash_2([hash_left, hash_right]);
    }
    current
}

fn custom_compute_mult(scalar: Field, point: Point) -> Point {
    let bjj_curve = baby_jubjub();

    let mut scalar_as_bits: [u1; 254] = [0; 254];
    let tmp = scalar.to_be_bits(crate::field::modulus_num_bits() as u32);

    // 251 instead of 0?
    for i in 221..254 {
        scalar_as_bits[i] = tmp[i];
    }

    // do add-n-double on scalar bits and point
    //let mut tmp_p = Point::new(point.x, point.y);
    let mut tmp_p = Point::zero();
    assert(bjj_curve.curve.contains(point)); // verify one summand on curve

    // if this loop is set to the correct number of bits, it's much faster!
    for bit_idx in 221..254 {
        let cur_bit = scalar_as_bits[bit_idx];
        tmp_p = bjj_curve.curve.add(tmp_p, tmp_p);
        if cur_bit == 1 {
            let t = bjj_curve.curve.add(point, tmp_p);

            tmp_p = t;
        }
    }
    //assert(res.eq(tmp_p));
    tmp_p
}

fn main(
    delegate_addr: Field, // address of delegate, private
    t_v: Field, // is this public or private?
    pk_enc_x: pub Field,
    pk_enc_y: pub Field,
    cts: pub [Field; 20 * 4], // (size of anonymity set) * (4 elements per ciphertext in format e_x, e_y, v_x, v_y)
    ct_random_states: pub [Field; 20],
    delegates: pub [Field; 20], // fixed length, padded with 0s These are delegate addresses (the anonymity set) in the same order as the cts
    vote_root: pub Field,
    vote_hashpath: pub [Field; 20], // padded w/ zeros
    vote_idx: pub Field
) {
    //do merkle tree inclusion check
    //let leaf = hash::pedersen([t_v])[0];
    let leaf = hash::poseidon::bn254::hash_1([t_v]);
    assert(vote_root == custom_compute_merkle_root(leaf, vote_idx, vote_hashpath));

    let bjj_curve = baby_jubjub();
    let pk = Point::new(pk_enc_x, pk_enc_y);

    // what if the delegate address specified in the proof is not in the anonymity set?
    for i in 0..20 {
        // NOTE: for testing, do NOT use delegate address = 0
        if delegates[i] != 0 {
            // if it isn't padding.
            let mut target = 0; // if it isn't the delegate, make sure it's the encryption of 0
            if delegates[i] == delegate_addr {
                target = t_v; // make sure it's the encryption of t_v
            }
            // verify the encryption
            let c_e = Point::new(cts[(i * 4) + 0], cts[(i * 4) + 1]); // e_x, e_y
            let c_v = Point::new(cts[(i * 4) + 2], cts[(i * 4) + 3]); // v_x, v_y

            let v = bjj_curve.curve.mul(ct_random_states[i], bjj_curve.base8);

            let w = bjj_curve.curve.mul(ct_random_states[i], pk);

            //let g_m = bjj_curve.curve.mul(target, bjj_curve.base8);
            let g_m = custom_compute_mult(target, bjj_curve.base8);

            let e = bjj_curve.curve.add(w, g_m);

            assert(e.eq(c_e));
            assert(v.eq(c_v));
        }
    }
}
