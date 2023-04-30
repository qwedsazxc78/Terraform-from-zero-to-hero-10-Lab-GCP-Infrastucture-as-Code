##################################################################################
# RESOURCE
##################################################################################
module "gcs-module-demo" {
  source   = "./modules/gcs"
  gcs_name = "${var.gcs_name}-${terraform.workspace}"
  location = var.location
}
