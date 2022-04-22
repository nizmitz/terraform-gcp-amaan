
output "Loadbalancer-IPv4-Address" {
  value = google_compute_global_address.global_ip.address
}
output "dns_record_name" {
  description = "the name of the record binded to"
  value       = "${cloudflare_record.amaan-cloudflare.name}.nizmitz.digital"
}