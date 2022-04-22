
resource "cloudflare_record" "amaan-cloudflare" {
  zone_id = var.cloudflare_zone_id
  name    = "amaan-testing"
  value   = google_compute_global_address.global_ip.address
  type    = "A"
  ttl     = 3600
  depends_on = [
    google_compute_global_address.global_ip
  ]
}
