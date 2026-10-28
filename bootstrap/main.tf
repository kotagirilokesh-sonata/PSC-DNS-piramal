data "google_project" "dns_projects" {
  for_each = toset(var.dns_project_ids)

  project_id = each.value
}

data "google_compute_network" "existing" {
  for_each = var.network_projects

  name    = each.value
  project = each.key
}

module "psc" {
  source = "../modules/psc"

  project_id           = var.project_id
  endpoint_name        = var.psc_endpoint_name
  forwarding_rule_name = var.psc_forwarding_rule_name
  network_self_link    = data.google_compute_network.existing[var.psc_network_name].self_link
  psc_target_bundle    = var.psc_target_bundle

  psc_ip_cidr = var.psc_ip_cidr
  psc_ip_host = var.psc_ip_host

  depends_on = [ module.iam ]
}

module "dns" {
  source            = "../modules/dns"
  network_self_links = [
    for network in data.google_compute_network.existing :
    network.self_link
  ]
  psc_endpoint_ip   = module.psc.endpoint_ip
  dns_zone_name     = var.dns_zone_name
  dns_domain        = var.dns_domain
  dns_record_ttl    = var.dns_record_ttl

  depends_on = [module.psc, module.iam]
}

module "iam" {
  source = "../modules/iam"

  user_id            = var.user_id
  psc_hub_project_id = var.psc_hub_project_id
  dns_project_ids    = var.dns_project_ids
}