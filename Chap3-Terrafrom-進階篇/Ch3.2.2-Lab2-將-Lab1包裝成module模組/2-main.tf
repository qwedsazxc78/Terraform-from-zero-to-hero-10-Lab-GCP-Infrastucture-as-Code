##################################################################################
# RESOURCE
##################################################################################
module "gcs-module-demo1" {
  source   = "./modules/gcs"
  gcs_name = "${var.gcs_name}-1"
  location = var.location
}

module "gcs-module-demo2" {
  source   = "./modules/gcs"
  gcs_name = "${var.gcs_name}-2"
  location = var.location
}
