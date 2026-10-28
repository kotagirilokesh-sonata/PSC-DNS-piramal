output "psc_endpoint_ip" {
  description = "Automatically allocated PSC endpoint IP"
  value       = module.psc.endpoint_ip
}

output "psc_endpoint_name" {
  description = "PSC endpoint name"
  value       = module.psc.endpoint_name
}

output "psc_endpoint_address_id" {
  description = "PSC endpoint address ID"
  value       = module.psc.endpoint_address_id
}

output "psc_forwarding_rule_name" {
  description = "PSC forwarding rule name"
  value       = module.psc.forwarding_rule_name
}