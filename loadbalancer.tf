resource "google_compute_global_address" "global_ip" {
  name = "amaan-lb-ipv4"
}

resource "google_compute_url_map" "amaan_url_http" {
  name            = "amaan-url-http"
  default_service = google_compute_backend_service.amaan_webserver_backend.id

}

resource "google_compute_target_http_proxy" "http_proxy" {
  name    = "proxy-http"
  url_map = google_compute_url_map.amaan_url_http.id
}

resource "google_compute_global_forwarding_rule" "http_forward" {
  name       = "forward-http"
  target     = google_compute_target_http_proxy.http_proxy.id
  ip_address = google_compute_global_address.global_ip.address
  port_range = "80"
}
