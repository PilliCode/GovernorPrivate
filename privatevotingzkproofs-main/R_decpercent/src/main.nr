use dep::std::ec::tecurve::affine::{Curve, Point};
use dep::std::ec::consts::te::baby_jubjub;
use dep::std;
/*
    Possible slowdown by making this a function and calling baby_jubjub() each time.
*/
fn verify_decrypt(sk: Field, cs: [Field; 4], m: Field) {
    /*
    cs = e.x, e.y, v.x, v.y
    computes g*m and checks if the ciphertext w/ sk corresponds to g*m
    */
    let bjj_curve = baby_jubjub();

    let e = Point::new(cs[0], cs[1]);
    let v = Point::new(cs[2], cs[3]);
    let w = bjj_curve.curve.mul(sk, v);

    let g_m = bjj_curve.curve.mul(m, bjj_curve.base8);

    assert(bjj_curve.curve.subtract(e, w).eq(g_m));
}

fn main(
    sk: Field, // tally committee's secret key
    pk_x: pub Field,
    pk_y: pub Field,
    cts: pub [Field; 4 * 3], // encrypted ciphertexts for tally committee decrypt
    vote_counts: [u32; 3], // the result of the tally committee's decryption
    percents: pub [u32; 3] // the percentage of each vote type
) {
    let bjj_curve = baby_jubjub();

    assert(bjj_curve.curve.mul(sk, bjj_curve.base8).eq(Point::new(pk_x, pk_y)));

    let denominator = vote_counts[0] + vote_counts[1] + vote_counts[2];

    for i in 0..3 {
        let e = Point::new(cts[(i * 4) + 0], cts[(i * 4) + 1]);
        let v = Point::new(cts[(i * 4) + 2], cts[(i * 4) + 3]);

        // turn these two multiplies to check colinearity
        let w = bjj_curve.curve.mul(sk, v);

        let g_m = bjj_curve.curve.mul(vote_counts[i] as Field, bjj_curve.base8);

        assert(bjj_curve.curve.subtract(e, w).eq(g_m));
        // verify the public percentages

        if denominator > 0 {
            assert((vote_counts[i] * 10000) / (denominator) == percents[i]);
        } else {
            assert(vote_counts[i] == 0);
        }
    }
    // at this point, we know that the messages are valid.
}
