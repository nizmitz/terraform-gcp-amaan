/*
resource "google_service_account" "default" {
  account_id   = "service-account-id"
  display_name = "Service Account"
}

resource "google_compute_instance_template" "default" {
  name        = "amaan_template"
  description = "This template is used to create app server instances."

  tags = ["type", "testing"]

  labels = {
    environment = "dev"
  }

  instance_description = "Wordpress Amaan Testing INstance"
  machine_type         = "f1-micro"
  can_ip_forward       = false
  preemptible = true
  auto_restart = false
  metadata_startup_script = "echo hi > /test.txt"
 

  // Create a new boot disk from an image
  disk {
    source_image      = "debian-cloud/debian-10"
    auto_delete       = true
    boot              = true

  // Use an existing disk resource
  disk {
    // Instance Templates reference disks by name, not self link
    source      = google_compute_disk.foobar.name
    auto_delete = false
    boot        = false
  }

  network_interface {
    network = "default"
  }

  metadata = {
    foo = "bar"
  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.default.email
    scopes = ["cloud-platform"]
  }
}

data "google_compute_image" "my_image" {
  family  = "debian-10"
  project = "debian-cloud"
}

resource "google_compute_disk" "foobar" {
  name  = "existing-disk"
  image = data.google_compute_image.my_image.self_link
  size  = 10
  type  = "pd-ssd"
  zone  = "asia-southeast2-a"
}
}
*/