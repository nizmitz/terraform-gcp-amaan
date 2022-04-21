resource "google_compute_network" "vpc_network" {
  name = "vpc-terraform-amaan"
}

resource "google_compute_firewall" "vpc_network" {
  name    = "firewall-terraform-amaan"
  network = google_compute_network.vpc_network.name
  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000"]
  }

  source_tags = ["web"]
}