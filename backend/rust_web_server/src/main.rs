
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
use crate::utils::constants;
use crate::utils::util;


mod delegate_registration;
use delegate_registration::{setup_delegates, options_delegate_registration, delegate_registration_call};

mod delegate_unregistration;
use delegate_unregistration::{options_delegate_unregistration, delegate_unregistration_call};

mod delegate;
use delegate::{options_delegate,delegate_call};

mod undelegate;
use undelegate::{options_undelegate,undelegate_call};

mod election_setup;
use election_setup::{options_election_setup,election_setup_call};

mod election_start;
use election_start::{options_election_start,election_start_call};

mod private_vote;
use private_vote::{options_private_vote, private_vote_call};

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
        .configure(rocket::Config::figment().merge(("address", "0.0.0.0")).merge(("port", 9797)))
        .mount(
            "/",
            routes![
                setup_delegates,
                options_delegate_registration,
                delegate_registration_call,
                options_delegate_unregistration,
                delegate_unregistration_call,
                options_delegate,
                delegate_call,
                options_undelegate,
                undelegate_call,
                election_setup_call,
                options_election_setup,
                election_start_call,
                options_election_start,
                options_private_vote,
                private_vote_call,
            ],
        )
}
