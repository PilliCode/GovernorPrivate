#[macro_use]
extern crate rocket;
use rocket::fairing::{Fairing, Info, Kind};
use rocket::http::Header;
use rocket::{Request, Response};


pub mod utils {
    #[path = "bjj_ah_elgamal.rs"]
    pub mod bjj_ah_elgamal;

    #[path = "util.rs"]
    pub mod util;

    #[path = "constants.rs"]
    pub mod constants;

    #[path = "merklehelper.rs"]
    pub mod merklehelper;
}
use crate::utils::bjj_ah_elgamal;
use crate::utils::merklehelper;

mod tally;
use tally::{decrypt_tally_call,options_decrypt_tally};

mod setup;
use setup::{trusted_auth_setup,options_trusted_auth_setup};

pub struct Cors;

#[rocket::async_trait]
impl Fairing for Cors {
    fn info(&self) -> Info {
        Info {
            name: "Cross-Origin-Resource-Sharing Fairing",
            kind: Kind::Response,
        }
    }

    async fn on_response<'r>(&self, _request: &'r Request<'_>, response: &mut Response<'r>) {
        response.set_header(Header::new("Access-Control-Allow-Origin", "*"));
        response.set_header(Header::new(
            "Access-Control-Allow-Methods",
            "POST, PATCH, PUT, DELETE, HEAD, OPTIONS, GET",
        ));
        response.set_header(Header::new("Access-Control-Allow-Headers", "*"));
        response.set_header(Header::new("Access-Control-Allow-Credentials", "true"));
    }
}

#[launch]
fn rocket() -> _ {
    rocket::build()
        .attach(Cors)
        .configure(rocket::Config::figment().merge(("port", 9999)))
        .mount(
            "/",
            routes![trusted_auth_setup, options_trusted_auth_setup, decrypt_tally_call, options_decrypt_tally],
        )
}

