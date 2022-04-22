
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

resource "google_compute_subnetwork" "amaan_subnet" {
  name                     = "amaan-jakarta-subnet"
  ip_cidr_range            = "10.0.1.0/24"
  network                  = google_compute_network.gcp_network.name
  region                   = lower(var.gcp_region)
  stack_type               = "IPV4_ONLY"
  private_ip_google_access = true
}

resource "google_compute_network" "gcp_network" {
  name                    = "vpc-amaan-emir"
  project                 = var.gcp_project
  auto_create_subnetworks = false
}

