# add auth to docker configuration
# gcloud auth configure-docker \
#     asia-docker.pkg.dev

# create the container registry
gcloud artifacts repositories create tf-cloud-run --repository-format=docker --location=asia

# build and push docker image
docker build -t asia-docker.pkg.dev/terraform101-384507/tf-cloud-run/cloud-run-tf-ch4-lab-7 .
docker push asia-docker.pkg.dev/terraform101-384507/tf-cloud-run/cloud-run-tf-ch4-lab-7

# play with cloud run -
# [note] in mac or windows, you need to remove --platform=linux/amd64
# docker run -p 8080:8080 -e PORT=8080 asia-docker.pkg.dev/terraform101-384507/tf-cloud-run/cloud-run-tf-ch4-lab-7
