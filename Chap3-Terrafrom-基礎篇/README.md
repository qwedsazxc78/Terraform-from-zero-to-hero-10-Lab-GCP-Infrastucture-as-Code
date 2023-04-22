# Lab 步驟

1. 先進入state-bucket 資料夾產生遠端的gcs作為backend

```BASH
cd state-bucket

terraform init
terraform apply -auto-approve

# or 快捷部署

tf init
tfd
```

2. 回到原先路徑，部署新的 bucket

```BASH
cd ..

terraform init
terraform apply -auto-approve

# or 快捷部署

tf init
tfd
```

3. 觀察GCS檔案是否產生state.json檔案