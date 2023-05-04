##################################################################################
# RESOURCE
##################################################################################
resource "google_bigtable_instance" "this" {
  name = var.bigtable_name

  deletion_protection = false

  cluster {
    cluster_id   = var.bigtable_name
    num_nodes    = 1
    storage_type = "HDD"
    zone         = var.GCP_ZONE
  }
}

# 建立 Cloud Bigtable 表格
resource "google_bigtable_table" "example_table" {
  instance_name = google_bigtable_instance.this.name
  name          = var.table_name

  column_family {
    family = "family-first"
  }

  column_family {
    family = "family-second"
  }
}
