project_id = "sonata-gcp-delivery"

user_id = "your-user@company.com"

psc_hub_project_id = "hub-projectid"

dns_project_ids = [
  "project-a",
  "project-b",
  "project-c"
]

network_names = [
  "s-vpc",
  "dev-vpc",
  "prod-vpc"
]
psc_network_name = "hub-network"
psc_endpoint_name = "pscendpoint"

psc_forwarding_rule_name = "pscforwardingrule"

psc_target_bundle = "all-apis"


# Private DNS zone for standard Google API hostnames.
dns_zone_name = "googleapis-private-zone"
dns_domain    = "googleapis.com."
dns_record_ttl = 300

psc_ip_cidr = "10.10.0.0/16"
psc_ip_host = 65530
