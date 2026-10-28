output "endpoint_ip" {
  description = "Automatically allocated PSC endpoint IP"
  value       = google_compute_global_address.endpoint.address
}

output "endpoint_name" {
  description = "PSC endpoint name"
  value       = google_compute_global_address.endpoint.name
}

output "endpoint_address_id" {
  description = "PSC endpoint address ID"
  value       = google_compute_global_address.endpoint.id
}

output "forwarding_rule_name" {
  description = "PSC forwarding rule name"
  value       = google_compute_global_forwarding_rule.endpoint.name
}

