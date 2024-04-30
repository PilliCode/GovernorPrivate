use std::sync::{Arc, Mutex};
use std::time::{Duration, Instant};
use once_cell::sync::Lazy;

// Define constants for timeout duration and redirect URL
const TIMEOUT_DURATION: Duration = Duration::from_secs(60); // Adjust timeout duration as needed
const REDIRECT_URL: &str = "/waiting"; // URL for redirecting new users

// Global state to track active users with last activity time
static ACTIVE_USER: Lazy<Arc<Mutex<Option<(Instant, bool)>>>> = Lazy::new(|| Arc::new(Mutex::new(None)));

// Handler for entering the website
#[get("/enter")]
pub fn enter_website() -> String {
    // Check if a user is already active
    let mut active_user = ACTIVE_USER.lock().unwrap();
    if let Some((last_activity, _)) = *active_user {
        // Check if timeout has elapsed
        if last_activity.elapsed() < TIMEOUT_DURATION {
            // Redirect to waiting page if timeout has not elapsed
            return format!("Redirecting to waiting page... <script>setTimeout(function(){{window.location='{}';}}, 3000);</script>", REDIRECT_URL);
        }
    }
    
    // No user is active or timeout has elapsed, set state and allow user to enter
    *active_user = Some((Instant::now(), true));
    return String::from("Welcome to the website!");
}

