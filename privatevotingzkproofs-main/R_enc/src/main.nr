use dep::std;
use dep::std::hash;
use dep::std::merkle;
use dep::std::ec::consts::te::baby_jubjub;
use dep::std::ec::tecurve::affine::{Curve, Point};
use dep::std::field;

fn custom_compute_mult(scalar: Field, point: Point) -> Point {
    let bjj_curve = baby_jubjub();

    let mut scalar_as_bits: [u1; 254] = [0; 254];
    let tmp = scalar.to_be_bits(crate::field::modulus_num_bits() as u32);

    for i in 221..254 {
        scalar_as_bits[i] = tmp[i];
    }

    // do add-n-double on scalar bits and point
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
    tmp_p
}

fn main(
    pk_x: pub Field,
    pk_y: pub Field,
    msg: pub Field,
    random_state: pub Field,
    c_e_x: pub Field,
    c_e_y: pub Field,
    c_v_x: pub Field,
    c_v_y: pub Field
) {
    let bjj_curve = baby_jubjub();

    let pk = Point::new(pk_x, pk_y);
    let c_e = Point::new(c_e_x, c_e_y);
    let c_v = Point::new(c_v_x, c_v_y);

    let v = bjj_curve.curve.mul(random_state, bjj_curve.base8);
    let w = bjj_curve.curve.mul(random_state, pk);

    let g_m = custom_compute_mult(msg, bjj_curve.base8);
    //let g_m = bjj_curve.curve.mul(msg, bjj_curve.base8);
    let e = bjj_curve.curve.add(w, g_m);

    assert(e.eq(c_e));
    assert(v.eq(c_v));
}
