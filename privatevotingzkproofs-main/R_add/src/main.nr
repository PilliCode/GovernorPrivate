use dep::std;
use dep::std::ec::consts::te::baby_jubjub;
use dep::std::ec::tecurve::affine::{Curve, Point};
use dep::std::merkle;
use dep::std::hash;

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

fn verify_add(e1: Point, v1: Point, e2: Point, v2: Point, e_res: Point, v_res: Point) {
    let bjj_curve = baby_jubjub();
    assert(bjj_curve.curve.add(e1, e2).eq(e_res));
    assert(bjj_curve.curve.add(v1, v2).eq(v_res));
}

fn main(
    e1x: pub Field,
    e1y: pub Field,
    v1x: pub Field,
    v1y: pub Field,
    e2x: pub Field,
    e2y: pub Field,
    v2x: pub Field,
    v2y: pub Field,
    e_resx: pub Field,
    e_resy: pub Field,
    v_resx: pub Field,
    v_resy: pub Field,
    // MT inputs
    mt_root: pub Field,
    mt_hashpath: pub [Field; 20], // padded w/ zeros
    mt_idx: pub Field
) {
    let leaf = hash::poseidon::bn254::hash_4([e2x, e2y, v2x, v2y]);

    assert(mt_root == custom_compute_merkle_root(leaf, mt_idx, mt_hashpath));

    let e1 = Point::new(e1x, e1y);
    let v1 = Point::new(v1x, v1y);
    let e2 = Point::new(e2x, e2y);
    let v2 = Point::new(v2x, v2y);
    let e_res = Point::new(e_resx, e_resy);
    let v_res = Point::new(v_resx, v_resy);
    verify_add(e1, v1, e2, v2, e_res, v_res);
}
