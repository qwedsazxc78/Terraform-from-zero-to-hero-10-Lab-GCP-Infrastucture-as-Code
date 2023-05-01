docker build -t gcr.io/terraform101-384507/cloud-run-tf-ch4-lab-7 .
docker push gcr.io/terraform101-384507/cloud-run-tf-ch4-lab-7

# docker run -p 8080:8080 -e PORT=8080 gcr.io/terraform101-384507/cloud-run-tf-ch4-lab-7
