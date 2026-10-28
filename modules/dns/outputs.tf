output "dns_zone_name" {
  description = "DNS managed zone name"
  value       = google_dns_managed_zone.googleapis.name
}

output "dns_zone_id" {
  description = "DNS managed zone ID"
  value       = google_dns_managed_zone.googleapis.id
}

output "psc_endpoint_ip" {
  description = "PSC endpoint IP used by DNS"
  value       = var.psc_endpoint_ip
}