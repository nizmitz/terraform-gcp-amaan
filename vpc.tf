resource "google_compute_network" "gcp_network" {
  name = "vpc-amaan-emir"
}

resource "google_compute_firewall" "allow_port_http_firewall_rule" {
  name        = "allow-port-http-firewall"
  network     = google_compute_network.gcp_network.name
  description = "allow_port_http"

  priority = 100

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["web"]
}