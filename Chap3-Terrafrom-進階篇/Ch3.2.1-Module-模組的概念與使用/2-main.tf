##################################################################################
# RESOURCE
##################################################################################
module "gcs-module-demo" {
  source   = "./modules/gcs"
  gcs_name = "quick-start-gcs-bucket-module"
  location = "asia-east1"
}
