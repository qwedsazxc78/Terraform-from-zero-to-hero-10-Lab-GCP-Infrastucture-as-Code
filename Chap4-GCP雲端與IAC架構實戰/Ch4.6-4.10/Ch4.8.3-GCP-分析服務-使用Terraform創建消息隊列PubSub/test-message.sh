gcloud pubsub topics publish \
"projects/terraform101-384507/topics/pubsub-topic-tf-ch-4-8-3" \
    --message "Hello, World"

gcloud pubsub subscriptions pull projects/terraform101-384507/subscriptions/pubsub-sub-tf-ch-4-8-3 --limit=10