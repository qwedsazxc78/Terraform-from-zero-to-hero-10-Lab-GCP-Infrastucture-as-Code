# gcloud compute ssh [VM名稱] --project [專案ID] --zone [區域] -- -L [本機端口]:[redis ip]]:[Redis端口]

gcloud compute ssh --zone "asia-northeast1-b" "redis-proxy" --project "terraform101-384507" -- -L 6379:10.113.113.68:6379
