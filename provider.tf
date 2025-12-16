
terraform {
  required_version = ">= 1.6.0"
  required_providers {
    google =    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}
provider "google" {
  project                     = var.project_id
  region                      = var.region
  zone                        = var.zone
  impersonate_service_account = var.impersonate_service_account
}
