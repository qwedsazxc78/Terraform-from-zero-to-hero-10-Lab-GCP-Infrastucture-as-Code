# terraform workflow

# 1. 初始化本地 Terraform 環境
terraform init

# 2. 格式化 Terraform 代碼。驗證 Terraform 代碼的語法與結構
terraform fmt
terraform validate

# 3. 比較 Terraform 狀態和雲端中實際狀態，建立並顯示一個執行計畫
terraform plan

# 4. 根據計畫執行實際的基礎架構創建或更改操作
terraform apply

# 5. 刪除此特定 Terraform 環境所管理的所有資源
terraform destroy
