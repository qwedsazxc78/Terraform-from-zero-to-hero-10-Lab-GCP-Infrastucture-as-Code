# gcloud compute ssh [VM名稱] --project [專案ID] --zone [區域] -- -L [本機端口]:[redis ip]]:[Redis端口]

gcloud compute ssh --zone "asia-northeast1-b" "redis-tf-ch4-12-2-connection" --project "terraform101-384507" -- -L 6379:10.143.79.147:6379
