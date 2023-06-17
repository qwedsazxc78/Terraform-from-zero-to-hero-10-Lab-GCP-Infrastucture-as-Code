# 創建dev/prd兩個工作空間workspace
terraform workspace new dev
terraform workspace new prd
terraform workspace list

# 2.回到dev的工作空間workspace做初始化，觀察terraform.tfstate.d資料夾
terraform workspace select dev
terraform init
terraform plan

# 3.回到prd的工作空間workspace做初始化，觀察terraform.tfstate.d資料夾
terraform workspace select prd
terraform init
terraform plan

# 4.回到dev的工作空間workspace做部署，觀察terraform.tfstate.d資料夾
terraform workspace select dev
terraform apply -auto-approve

# 5.回到prd的工作空間workspace做部署，觀察terraform.tfstate.d資料夾
terraform workspace select prd
terraform apply -auto-approve

# 6.清理dev/prd的資源
terraform workspace select dev
terraform destroy -auto-approve

terraform workspace select prd
terraform destroy -auto-approve

# 7.觀察terraform.tfstate.d資料夾
