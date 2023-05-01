# 無訂閱者
gcloud pubsub topics publish "projects/terraform101-384507/topics/pubsub-topic-tf-ch4-lab9" \
    --message "Hello, World"

# 訂閱者a
gcloud pubsub topics publish "projects/terraform101-384507/topics/pubsub-topic-tf-ch4-lab9" \
    --message "Hello, World user a" \
    --attribute=user=a

# 訂閱者b
gcloud pubsub topics publish "projects/terraform101-384507/topics/pubsub-topic-tf-ch4-lab9" \
    --message "Hello, World user b" \
    --attribute=user=b

# 訂閱者b (a會被覆蓋)
gcloud pubsub topics publish "projects/terraform101-384507/topics/pubsub-topic-tf-ch4-lab9" \
    --message "Hello, World user a & b" \
    --attribute=user=a,user=b