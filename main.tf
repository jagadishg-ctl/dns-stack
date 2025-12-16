

resource "google_project_service" "dns" {
  project            = var.project_id
  service            = "dns.googleapis.com"
  disable_on_destroy = false
}

# Read VM stack outputs from GCS remote state (points to your VM stack)
data "terraformdata "terraform_remote_state" "vm" {
  backend = "gcs"
  config = {
    bucket = "migration_gcs"
    prefix = "state/stack-vm"
  }
}

module "dns" {
  source            = "./modules/dns"   # <-- DNS module folder lives inside gcp-dns-stack/modules/dns
  project_id        = var.project_id
  managed_zone_name = var.managed_zone_name
  dns_name          = var.dns_name
  vm_public_ip      = data.terraform_remote_state.vm.outputs.vm_external_ip

  depends_on = [google_project_service.dns]
