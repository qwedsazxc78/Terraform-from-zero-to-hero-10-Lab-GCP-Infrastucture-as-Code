##################################################################################
# RESOURCE
##################################################################################
# 創建 PubSub 主題和訂閱
resource "google_pubsub_topic" "hello_topic" {
  name = var.topic_name
}

resource "google_pubsub_subscription" "hello_subscription_a" {
  name  = var.subscription_name_a
  topic = google_pubsub_topic.hello_topic.id

  filter = "attributes.user = \"a\""
}

resource "google_pubsub_subscription" "hello_subscription_b" {
  name  = var.subscription_name_b
  topic = google_pubsub_topic.hello_topic.id

  filter = "attributes.user = \"b\""
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

output "subscription_a_url" {
  value = google_pubsub_subscription.hello_subscription_a.id
}

output "subscription_b_url" {
  value = google_pubsub_subscription.hello_subscription_b.id
}
