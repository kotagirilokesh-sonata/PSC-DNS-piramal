variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "endpoint_name" {
  description = "PSC endpoint name"
  type        = string
}

variable "forwarding_rule_name" {
  description = "PSC forwarding rule name"
  type        = string
}

variable "network_self_link" {
  description = "VPC network self link"
  type        = string
}

variable "psc_target_bundle" {
  description = "PSC target bundle"
  type        = string

  validation {
    condition     = contains(["all-apis", "vpc-sc"], var.psc_target_bundle)
    error_message = "psc_target_bundle must be either all-apis or vpc-sc."
  }
}

variable "psc_ip_cidr" {
  description = "CIDR from which Terraform calculates the PSC endpoint IP"
  type        = string
}

variable "psc_ip_host" {
  description = "Host number to calculate the PSC endpoint IP"
  type        = number
}