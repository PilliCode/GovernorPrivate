use dep::std;
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
    e1x: pub Field,
    e1y: pub Field,
    v1x: pub Field,
    v1y: pub Field,
    tpi: pub Field,
    e_resx: pub Field,
    e_resy: pub Field,
    v_resx: pub Field,
    v_resy: pub Field
) {
    let bjj_curve = baby_jubjub();

    //let pk = Point::new(pk_x, pk_y);
    let c_e = Point::new(e1x, e1y);
    let c_v = Point::new(v1x, v1y);

    // optimize out the random state (just 0, 0*anything is O), pk doesn't matter here.
    let v = Point::new(0, 1); //bjj_curve.curve.mul(0, bjj_curve.base8);
    let w = Point::new(0, 1); //bjj_curve.curve.mul(0, pk);

    //let g_m = bjj_curve.curve.mul(tpi, bjj_curve.base8);
    let g_m = custom_compute_mult(tpi, bjj_curve.base8);
    let e = bjj_curve.curve.add(w, g_m);

    assert(bjj_curve.curve.add(c_e, e.negate()).eq(Point::new(e_resx, e_resy)));
    assert(bjj_curve.curve.add(c_v, v.negate()).eq(Point::new(v_resx, v_resy)));
}
