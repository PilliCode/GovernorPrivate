// adds two ciphertext vectors of length 20 (has to be the same size as the anonymity set)
use dep::std;
use dep::std::ec::consts::te::baby_jubjub;
use dep::std::ec::tecurve::affine::{Curve, Point};

fn main(summand1: pub [Field; 20 * 4], summand2: pub [Field; 20 * 4], sum: pub [Field; 20 * 4]) {
    let bjj_curve = baby_jubjub();

    for i in 0..20 {
        // if it's not padding
        if !((summand1[(i * 4) + 0] == 0)
            & (summand1[(i * 4) + 1] == 0)
            & (summand1[(i * 4) + 2] == 0)
            & (summand1[(i * 4) + 3] == 0)
            & (summand2[(i * 4) + 0] == 0)
            & (summand2[(i * 4) + 1] == 0)
            & (summand2[(i * 4) + 2] == 0)
            & (summand2[(i * 4) + 3] == 0)
            & (sum[(i * 4) + 0] == 0)
            & (sum[(i * 4) + 1] == 0)
            & (sum[(i * 4) + 2] == 0)
            & (sum[(i * 4) + 3] == 0)) {
            let e1 = Point::new(summand1[(i * 4) + 0], summand1[(i * 4) + 1]);
            let v1 = Point::new(summand1[(i * 4) + 2], summand1[(i * 4) + 3]);
            let e2 = Point::new(summand2[(i * 4) + 0], summand2[(i * 4) + 1]);
            let v2 = Point::new(summand2[(i * 4) + 2], summand2[(i * 4) + 3]);
            let e_res = Point::new(sum[(i * 4) + 0], sum[(i * 4) + 1]);
            let v_res = Point::new(sum[(i * 4) + 2], sum[(i * 4) + 3]);

            assert(bjj_curve.curve.add(e1, e2.negate()).eq(e_res));
            assert(bjj_curve.curve.add(v1, v2.negate()).eq(v_res));
        }
    }
}
