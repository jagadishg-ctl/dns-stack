
output "zone_name"      { value = google_dns_managed_zone.public_zone.name }
output "root_a_fqdn"output "root_a_fqdn"    { value = google_dns_record_set.root_a.name }
