##################################################################################
# RESOURCE
##################################################################################
# 創建 BigQuery 資料集
resource "google_bigquery_dataset" "example_dataset" {
  dataset_id  = var.bigquery_name
  description = "Terraform 101 - bq"
  location    = var.GCP_REGION
}

# 創建 BigQuery 表格
resource "google_bigquery_table" "example_table" {
  dataset_id = google_bigquery_dataset.example_dataset.dataset_id
  table_id   = "example_table"

  deletion_protection = false

  # 定義表格結構
  schema = <<EOF
[
  {
    "name": "name",
    "type": "STRING"
  },
  {
    "name": "age",
    "type": "INTEGER"
  },
  {
    "name": "gender",
    "type": "STRING"
  }
]
EOF


}

output "bq_dataset" {
  value = google_bigquery_table.example_table.dataset_id
}

output "bq_table" {
  value = google_bigquery_table.example_table.table_id
}
