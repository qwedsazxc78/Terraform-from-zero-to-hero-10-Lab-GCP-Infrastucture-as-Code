##################################################################################
# RESOURCE
##################################################################################
module "gcs-module-demo" {
  source   = "./modules/gcs"
  gcs_name = var.gcs_name
  location = var.location
}
