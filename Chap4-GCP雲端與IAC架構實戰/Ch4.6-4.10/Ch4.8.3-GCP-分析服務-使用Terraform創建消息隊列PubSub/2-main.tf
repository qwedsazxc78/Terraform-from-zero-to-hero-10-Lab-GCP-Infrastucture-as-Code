##################################################################################
# RESOURCE
##################################################################################
# 創建 PubSub 主題和訂閱
resource "google_pubsub_topic" "hello_topic" {
  name = var.topic_name
}

resource "google_pubsub_subscription" "hello_subscription" {
  name  = var.subscription_name
  topic = google_pubsub_topic.hello_topic.id
}

# 創建 PubSub 消息
resource "google_pubsub_topic_iam_member" "hello_topic_iam" {
  topic  = google_pubsub_topic.hello_topic.name
  role   = "roles/pubsub.publisher"
  member = "allUsers"
}


# 輸出主題和訂閱的網址
output "topic_url" {
  value = google_pubsub_topic.hello_topic.id
}

output "subscription_url" {
  value = google_pubsub_subscription.hello_subscription.id
}
