use axum::{routing::get, Router};
use std::net::SocketAddr;
use tower_http::cors::{Any, CorsLayer};
use tracing::info;
use tracing_subscriber::{layer::SubscriberExt, util::SubscriberInitExt};

// Placeholder for future modules
// mod api;
// mod db;
// mod errors;
// mod models;
// mod services;

async fn root_handler() -> &'static str {
    "Hello, World from Appointment Manager Backend!"
}

#[tokio::main]
async fn main() {
    // Initialize tracing (for logging)
    tracing_subscriber::registry()
        .with(tracing_subscriber::EnvFilter::new(
            std::env::var("RUST_LOG").unwrap_or_else(|_| "appointment_manager_backend=debug,tower_http=debug".into()),
        ))
        .with(tracing_subscriber::fmt::layer())
        .init();

    // Load .env file if present
    dotenvy::dotenv().ok();

    // TODO: Initialize database connection pool here
    // let db_pool = db::init_pool().await.expect("Failed to initialize database pool");

    // CORS middleware
    let cors = CorsLayer::new()
        .allow_origin(Any) // In production, restrict this to your frontend's URL
        .allow_methods(Any)
        .allow_headers(Any);

    // Build our application with a route
    let app = Router::new()
        .route("/", get(root_handler))
        // .nest("/api/v1", api::routes(db_pool.clone())) // Example for future API routes
        .layer(cors);

    // Run it
    let port = std::env::var("PORT")
        .ok()
        .and_then(|s| s.parse().ok())
        .unwrap_or(3000_u16);

    let addr = SocketAddr::from(([0, 0, 0, 0], port));
    info!("Listening on {}", addr);

    let listener = tokio::net::TcpListener::bind(addr).await.unwrap();
    axum::serve(listener, app.into_make_service())
        .await
        .unwrap();
}
