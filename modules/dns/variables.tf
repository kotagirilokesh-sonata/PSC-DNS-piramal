variable "dns_zone_name" {
  type = string
}

variable "dns_domain" {
  type = string
}

variable "dns_record_ttl" {
  type    = number
  default = 300
}

variable "psc_endpoint_ip" {
  type = string
}

variable "network_self_links" {
  description = "List of VPC network self-links that can use this private DNS zone."
  type        = list(string)
}