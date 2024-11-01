resource "google_storage_bucket" "tfstate" {
  project                     = var.project_id
  name                        = var.bucket_name
  location                    = var.region
  force_destroy               = false
  uniform_bucket_level_access = true
}