##################################################################################
# Backend
##################################################################################
terraform {
  backend "gcs" {
    bucket  = "terraform-101-state-bucket"
    prefix  = "terraform/state"
    project = "terraform101-384507"
  }
}
