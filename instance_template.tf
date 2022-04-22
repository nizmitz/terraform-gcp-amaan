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
    preemptible       = true


  }

  lifecycle {
    create_before_destroy = true
  }

  metadata = {
    startup-script = <<-EOF
    apt update 
    apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common -y
    apt install wget -y
    curl -fsSL https://download.docker.com/linux/debian/gpg |  apt-key add -
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
    apt update
    apt install docker-ce -y
    curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
    ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
    wget https://raw.githubusercontent.com/nizmitz/terraform-gcp-amaan/main/docker-compose.yaml -O /root/docker-compose.yaml
    cd /root
    docker-compose up -d 
    EOF
  }
}

resource "google_compute_instance_group_manager" "amaan_webserver" {
  name               = "amaan-webserver-igm"
  base_instance_name = "amaan-web"
  zone               = lower(var.gcp_zone)

  version {
    instance_template = google_compute_instance_template.amaan_template.id
  }

  target_size = 1

  named_port {
    name = "wordpress"
    port = 80
  }

  auto_healing_policies {
    health_check      = google_compute_http_health_check.autohealing.id
    initial_delay_sec = 900
  }
}

resource "google_compute_autoscaler" "amaan_autoscaler" {
  name   = "amaan-igm-autoscaler"
  zone   = lower(var.gcp_zone)
  target = google_compute_instance_group_manager.amaan_webserver.id

  autoscaling_policy {
    max_replicas    = 2
    min_replicas    = 1
    cooldown_period = 600

    cpu_utilization {
      target = 0.9
    }
  }
}