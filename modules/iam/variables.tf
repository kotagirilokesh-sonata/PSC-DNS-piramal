variable "user_id" {
  description = "Google user email."
  type        = string
}

variable "psc_hub_project_id" {
  description = "Project where the PSC hub is created."
  type        = string
}

variable "dns_project_ids" {
  description = "Projects where the user needs DNS Administrator permissions."
  type        = set(string)
}