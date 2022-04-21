resource "google_compute_network" "vpc-terraform-amaan-fattahemiryanuar" {
  name = "vpc-terraform-amaan-fattahemiryanuar"
}

resource "google_compute_firewall" "allow-port-http-firewall-rule" {
  name    = "allow-port-http-firewall-rule"
  network = google_compute_network.vpc_network.name
  description = "allow-port-http"
  direction = INGRESS 
  priority = 100

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  source_tags = ["foo"]
  target_tags = ["web"]
}