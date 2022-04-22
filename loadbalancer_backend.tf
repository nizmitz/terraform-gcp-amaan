
resource "google_compute_backend_service" "amaan_webserver_backend" {
  name        = "amaan-backend"
  port_name   = "wordpress"
  protocol    = "HTTP"
  timeout_sec = 10

  health_checks = [google_compute_http_health_check.autohealing.id]

  backend {
    group                 = google_compute_instance_group_manager.amaan_webserver.instance_group
    balancing_mode        = "RATE"
    capacity_scaler       = 1.0
    max_rate_per_instance = 500
  }
}

resource "google_compute_http_health_check" "autohealing" {
  name                = "autohealing-health-check"
  request_path        = "/wp-admin/install.php"
  check_interval_sec  = 5
  timeout_sec         = 1
  healthy_threshold   = 2
  unhealthy_threshold = 10
}
