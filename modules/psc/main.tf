locals {
  psc_ip = cidrhost(var.psc_ip_cidr, var.psc_ip_host)
}

resource "google_compute_global_address" "endpoint" {
  name         = var.endpoint_name
  project      = var.project_id
  address_type = "INTERNAL"
  purpose      = "PRIVATE_SERVICE_CONNECT"
  network      = var.network_self_link

  address = local.psc_ip
}

resource "google_compute_global_forwarding_rule" "endpoint" {
  name                  = var.forwarding_rule_name
  project               = var.project_id
  target                = var.psc_target_bundle
  network               = var.network_self_link
  ip_address            = google_compute_global_address.endpoint.id
  load_balancing_scheme = ""
}