# 無訂閱者
gcloud pubsub topics publish "projects/terraform101-384507/topics/pubsub-topic-tf-ch4-lab9" \
    --message "Hello, World"

# 訂閱者a
gcloud pubsub topics publish "projects/terraform101-384507/topics/pubsub-topic-tf-ch4-lab9" \
    --message "Hello, World user a" \
    --attribute=user=a

gcloud pubsub subscriptions pull projects/terraform101-384507/subscriptions/pubsub-sub-tf-ch4-lab9-a --limit=10

# 訂閱者b
gcloud pubsub topics publish "projects/terraform101-384507/topics/pubsub-topic-tf-ch4-lab9" \
    --message "Hello, World user b" \
    --attribute=user=b

gcloud pubsub subscriptions pull projects/terraform101-384507/subscriptions/pubsub-sub-tf-ch4-lab9-b --limit=10

# 訂閱者b (a會被覆蓋)
gcloud pubsub topics publish "projects/terraform101-384507/topics/pubsub-topic-tf-ch4-lab9" \
    --message "Hello, World user a & b" \
    --attribute=user=a,user=b

gcloud pubsub subscriptions pull projects/terraform101-384507/subscriptions/pubsub-sub-tf-ch4-lab9-a --limit=10

gcloud pubsub subscriptions pull projects/terraform101-384507/subscriptions/pubsub-sub-tf-ch4-lab9-b --limit=10