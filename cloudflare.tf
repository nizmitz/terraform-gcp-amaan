resource "cloudflare_record" "waifu-botter-dns" {
  zone_id = var.cloudflare_zone_id
  name    = google_compute_instance.vm_instance.name
  value   = google_compute_instance.vm_instance.network_interface.0.access_config.0.nat_ip
  type    = "A"
  ttl     = 3600
  depends_on = [
    google_compute_instance.vm_instance
  ]
}