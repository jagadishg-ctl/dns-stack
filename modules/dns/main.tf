
resource "google_dns_managed_zone" "public_zone" {
  name        = var.managed_zone_name
  project     = var.project_id
  dns_name    = var.dns_name
  visibility  = "public"
  description = "Public zone for ${  description = "Public zone for ${var.dns_name}"
}

resource "google_dns_record_set" "root_a" {
  name         = var.dns_name            # "lumenmigrationfactory.com."
  type         = "A"
  ttl          = 300
  managed_zone = google_dns_managed_zone.public_zone.name
  rrdatas      = [var.vm_public_ip]
}

resource "google_dns_record_set" "www_cname" {
  name         = "www.${var.dns_name}"   # "www.lumenmigrationfactory.com."
  type         = "CNAME"
  ttl          = 300
  managed_zone = google_dns_managed_zone.public_zone.name
  rrdatas      = [var.dns_name]
}  
