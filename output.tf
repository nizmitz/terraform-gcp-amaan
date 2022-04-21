/*
output "ip-address-internal" {
  description = "ip of the compute engine instance"
  value       = google_compute_instance.vm_instance.network_interface.0.network_ip
}
output "ip-address-external" {
  description = "external ip of the compute engine instance"
  value       = google_compute_instance.vm_instance.network_interface.0.access_config.0.nat_ip
}
output "instance-name" {
  description = "name of the instance created"
  value       = google_compute_instance.vm_instance.name
}

output "dns-record-name" {
  description = "the name of the record binded to"
  value       = cloudflare_record.waifu-botter-dns.name
}
*/