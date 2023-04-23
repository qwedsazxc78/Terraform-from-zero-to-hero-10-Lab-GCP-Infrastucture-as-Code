# real testing: it required time to wait kubernete stable, and you can deploy helm
##################################################################################
# Helm
##################################################################################
module "gcs-module-demo" {
  source   = "./modules/gcs"
  gcs_name = "${var.gcs_name}-${terraform.workspace}"
  location = var.location
}
