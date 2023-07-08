# gcloud compute ssh [VM名稱] --project [專案ID] --zone [區域] -- -L [本機端口]:localhost:[Redis端口]

gcloud compute ssh [VM名稱] --project [專案ID] --zone [區域] -- -L 6379:localhost:6379