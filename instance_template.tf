resource "google_compute_instance_template" "amaan_template" {
  name_prefix  = "amaan-template-"
  machine_type = var.instance_type
  region       = lower(var.gcp_region)
  project      = var.gcp_project
  description  = "Amaan testing"
  tags         = ["web"]


  // boot disk
  disk {
    source_image = "debian-cloud/debian-10"
    auto_delete  = true
    boot         = true
    disk_type    = "pd-ssd"
    disk_size_gb = 15
  }
  // networking
  network_interface {
    subnetwork = google_compute_subnetwork.amaan_subnet.name
    access_config {
      network_tier = "STANDARD"
    }
  }
  scheduling {
    automatic_restart = false
    preemptible = true
    
    
  }

  lifecycle {
    create_before_destroy = true
  }
  metadata_startup_script = ""
}
/*
resource "google_compute_instance_group_manager" "amaan_webserver" {
  name               = "amaan-webserver-igm"
  version {
    instance_template  = google_compute_instance_template.amaan_template.id
  }
  base_instance_name = "amaan-web"
  zone               =  lower(var.gcp_zone)
  target_size        = "1"
  
  named_port {
    name = "wordpress"
    port = 80
  }

  auto_healing_policies {
    health_check      = google_compute_health_check.autohealing.id
    initial_delay_sec = 600
  }
}

resource "google_compute_health_check" "autohealing" {
  name                = "autohealing-health-check"
  check_interval_sec  = 10
  timeout_sec         = 10
  healthy_threshold   = 10
  unhealthy_threshold = 10 # 50 seconds

  http_health_check {
    request_path = "/healthz"
    port         = "80"
  }
}
*/