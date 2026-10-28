variable "project_id" {
  description = "Google Cloud project containing the existing VPC and where PSC and DNS resources are created."
  type        = string
  default     = "sonata-gcp-delivery"
}

variable "network_names" {
  description = "List of existing VPC networks that should be attached to the private DNS zone."
  type        = set(string)
}

variable "psc_endpoint_name" {
  description = "Name of the global forwarding rule used as the PSC endpoint."
  type        = string
  default     = "samplegooglepsc"
}

variable "endpoint_address_name" {
  description = "Name of the reserved global internal IP address for the PSC endpoint."
  type        = string
  default     = "google-apis-psc-address"
}

variable "psc_endpoint_ip" {
  description = "Optional reserved internal IP address for the PSC endpoint. Leave null to have Google Cloud allocate one."
  type        = string
  default     = null
  nullable    = true
}

variable "psc_target_bundle" {
  description = "Google APIs bundle targeted by the PSC endpoint."
  type        = string
  default     = "all-apis"

  validation {
    condition     = contains(["all-apis", "vpc-sc"], var.psc_target_bundle)
    error_message = "psc_target_bundle must be either all-apis or vpc-sc."
  }
}

variable "dns_zone_name" {
  description = "Name of the private Cloud DNS managed zone for Google APIs."
  type        = string
  default     = "google-apis-private"
}

variable "dns_domain" {
  description = "DNS domain served by the private zone. Include the trailing dot."
  type        = string
  default     = "googleapis.com."

  validation {
    condition     = endswith(var.dns_domain, ".")
    error_message = "dns_domain must be a fully-qualified DNS name ending in a dot."
  }
}

variable "dns_record_ttl" {
  description = "TTL, in seconds, for the private Google APIs A records."
  type        = number
  default     = 300

  validation {
    condition     = var.dns_record_ttl > 0
    error_message = "dns_record_ttl must be greater than zero."
  }
}
variable "psc_forwarding_rule_name" {
  type = string
}



variable "psc_ip_cidr" {
  description = "CIDR used for PSC endpoint IP allocation"
  type        = string
}

variable "psc_ip_host" {
  description = "Host number used for PSC endpoint IP allocation"
  type        = number
}

variable "psc_network_name" {
  description = "VPC network where the PSC endpoint is created."
  type        = string
}

variable "user_id" {
  description = "Google user email."
  type        = string
}

variable "psc_hub_project_id" {
  description = "PSC Hub project."
  type        = string
}

variable "dns_project_ids" {
  description = "Projects where DNS Admin is required."
  type        = set(string)
}