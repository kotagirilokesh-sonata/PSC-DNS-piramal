data "google_project" "psc_hub" {
  project_id = var.psc_hub_project_id
}

resource "google_project_iam_member" "psc_hub_dns_peer" {
  project = data.google_project.psc_hub.project_id
  role    = "roles/dns.peer"
  member  = "user:${var.user_id}"
}

resource "google_project_iam_member" "dns_admin" {
  for_each = data.google_project.dns_projects

  project = each.value.project_id
  role    = "roles/dns.admin"
  member  = "user:${var.user_id}"
}