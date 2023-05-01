gcloud container clusters get-credentials gke-tf-ch4-lab8 --region asia-northeast1 --project terraform101-384507

kubectl create deployment hello-server --image=gcr.io/google-samples/hello-app:1.0
kubectl expose deployment hello-server --type=LoadBalancer --port 8080
kubectl get service

http://[EXTERNAL-IP]:8080
