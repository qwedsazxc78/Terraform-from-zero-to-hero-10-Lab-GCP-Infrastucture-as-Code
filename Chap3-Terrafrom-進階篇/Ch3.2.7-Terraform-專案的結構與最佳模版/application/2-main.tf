##################################################################################
# LOCALS
##################################################################################
locals {
  env = var.WORKSPACE_ENV

  region   = jsondecode(file("${path.module}/infra/${var.WORKSPACE_ENV}-app.json"))["region"]
  zones    = jsondecode(file("${path.module}/infra/${var.WORKSPACE_ENV}-app.json"))["zones"]
  regional = jsondecode(file("${path.module}/infra/${var.WORKSPACE_ENV}-app.json"))["regional"]

  kubernetes_version  = jsondecode(file("${path.module}/infra/${var.WORKSPACE_ENV}-app.json"))["kubernetes_version"]
  vpa                 = jsondecode(file("${path.module}/infra/${var.WORKSPACE_ENV}-app.json"))["vpa"]
  hpa                 = jsondecode(file("${path.module}/infra/${var.WORKSPACE_ENV}-app.json"))["hpa"]
  cluster_autoscaling = jsondecode(file("${path.module}/infra/${var.WORKSPACE_ENV}-app.json"))["cluster_autoscaling"]

  default_pool_name         = jsondecode(file("${path.module}/infra/${var.WORKSPACE_ENV}-app.json"))["default_pool_name"]
  default_pool_spot_type    = jsondecode(file("${path.module}/infra/${var.WORKSPACE_ENV}-app.json"))["default_pool_spot_type"]
  default_pool_node_type    = jsondecode(file("${path.module}/infra/${var.WORKSPACE_ENV}-app.json"))["default_pool_node_type"]
  default_pool_min_count    = jsondecode(file("${path.module}/infra/${var.WORKSPACE_ENV}-app.json"))["default_pool_min_count"]
  default_pool_max_count    = jsondecode(file("${path.module}/infra/${var.WORKSPACE_ENV}-app.json"))["default_pool_max_count"]
  default_pool_disk_size_gb = jsondecode(file("${path.module}/infra/${var.WORKSPACE_ENV}-app.json"))["default_pool_disk_size_gb"]

  common_label = merge(jsondecode(file("${path.module}/infra/app-tags.json")),
    {
      "env" : var.WORKSPACE_ENV
    }
  )
}
##################################################################################
# RESOURCES
##################################################################################
