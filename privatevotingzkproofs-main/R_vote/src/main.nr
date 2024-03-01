use dep::std;
use dep::std::ec::tecurve::affine::{Curve, Point};
use dep::std::ec::consts::te::baby_jubjub;
use dep::std::hash;
use dep::std::merkle;
use dep::std::ecdsa_secp256k1;

fn custom_compute_merkle_root<N>(leaf: Field, index: Field, hash_path: [Field; N]) -> Field {
    // for hashpaths of length 20
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

fn verify_rerand(
    random_state: Field,
    pk_x: Field,
    pk_y: Field,
    og_e_x: Field,
    og_e_y: Field,
    og_v_x: Field,
    og_v_y: Field,
    rerand_res_e_x: Field,
    rerand_res_e_y: Field,
    rerand_res_v_x: Field,
    rerand_res_v_y: Field
) {
    // a, d, gen 
    //let bjj_curve = Curve::new(168700, 168696, Point::new(995203441582195749578291179787384436505546430278305826713579947235728471134,5472060717959818805561601436314318772137091100104008585924551046643952123905));
    let bjj_curve = baby_jubjub();
    //let g = Point::new(995203441582195749578291179787384436505546430278305826713579947235728471134, 5472060717959818805561601436314318772137091100104008585924551046643952123905);
    // these are coordinates for the 'base point' B
    //let base_point = Point::new(5299619240641551281634865583518297030282874472190772894086521144482721001553, 16950150798460657717958625567821834550301663161624707787222815936182638968203);

    // reconstruct points from coordinates
    let pk = Point::new(pk_x, pk_y);
    let rerand_res_e = Point::new(rerand_res_e_x, rerand_res_e_y);
    let rerand_res_v = Point::new(rerand_res_v_x, rerand_res_v_y);
    let e = Point::new(og_e_x, og_e_y);
    let v = Point::new(og_v_x, og_v_y);

    // do re-randomization
    let g_r = bjj_curve.curve.mul(random_state, bjj_curve.base8); //.base8, .curve
    //let g_r = bjj_curve.curve.mul(random_state, g); 
    let pk_r = bjj_curve.curve.mul(random_state, pk);

    let v_rerand = bjj_curve.curve.add(v, g_r);
    let e_rerand = bjj_curve.curve.add(e, pk_r);

    // assert correctness
    assert(v_rerand.eq(rerand_res_v));
    assert(e_rerand.eq(rerand_res_e));
}

fn verify_encrypt(
    pk_x: Field,
    pk_y: Field,
    msg: Field,
    random_state: Field,
    c_e_x: Field,
    c_e_y: Field,
    c_v_x: Field,
    c_v_y: Field
) {
    let bjj_curve = baby_jubjub(); // maybe it's slow to define this in non-main function

    let pk = Point::new(pk_x, pk_y);
    let c_e = Point::new(c_e_x, c_e_y);
    let c_v = Point::new(c_v_x, c_v_y);

    let v = bjj_curve.curve.mul(random_state, bjj_curve.base8);
    let w = bjj_curve.curve.mul(random_state, pk);

    let g_m = bjj_curve.curve.mul(msg, bjj_curve.base8);
    let e = bjj_curve.curve.add(w, g_m);

    assert(e.eq(c_e));
    assert(v.eq(c_v));
}

fn main(
    i: Field,
    randomness: [Field; 3],
    pk_enc_x: pub Field,
    pk_enc_y: pub Field,
    enc_delegate_voting_power: pub [Field; 4], // L[d]
    encryptions: pub [Field; 4 * 3], // ('e' in the doc). yes, no, abstain
    // merkle proof stuff
    delegate_idx: pub Field,// private?
    root_eid: pub Field,
    voting_power_hashpath: pub [Field; 20]
) {
    //assert(i <= 2 && i >= 0);
    assert(i as u64 <= 2);

    let bjj_curve = baby_jubjub();
    let pk = Point::new(pk_enc_x, pk_enc_y);

    // hashing an encryption is hashing 4 elements
    let leaf = hash::poseidon::bn254::hash_4(enc_delegate_voting_power);

    // ensure that the delegate is voting with how many votes they actually have (according to the merkle tree)
    assert(root_eid == custom_compute_merkle_root(leaf, delegate_idx, voting_power_hashpath));

    for idx in 0..3 {
        let g_r = bjj_curve.curve.mul(randomness[idx], bjj_curve.base8); //.base8, .curve
        let pk_r = bjj_curve.curve.mul(randomness[idx], pk);

        let c_e = Point::new(encryptions[(idx * 4) + 0], encryptions[(idx * 4) + 1]);
        let c_v = Point::new(encryptions[(idx * 4) + 2], encryptions[(idx * 4) + 3]);

        if idx == i {
            // if the delegate is voting for this option, ensure that it's a rerandomization of their voting power

            let e = Point::new(enc_delegate_voting_power[0], enc_delegate_voting_power[1]);
            let v = Point::new(enc_delegate_voting_power[2], enc_delegate_voting_power[3]);

            // do re-randomization
            let v_rerand = bjj_curve.curve.add(v, g_r);
            let e_rerand = bjj_curve.curve.add(e, pk_r);

            // assert correctness
            assert(v_rerand.eq(c_v));
            assert(e_rerand.eq(c_e));
        } else {
            // verify the encryption
            // NOTE: mul by 0?? Same issue in R_del
            // make this the point at infinity 0,1,0?
            //let g_m = bjj_curve.curve.mul(0, bjj_curve.base8);
            //let g_m = Point::new(0, 1);
            //let e = bjj_curve.curve.add(pk_r, g_m);
            let e = pk_r;

            assert(e.eq(c_e));
            assert(g_r.eq(c_v));
        }
    }
}
