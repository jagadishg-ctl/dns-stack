
output "dns_zone_name"   { value = module.dns.zone_name }
output "root_a_record"   { value = module.dns.root_a_fqdn }
output "www_cname_record"{ value = module.dns.www_cname_fq
