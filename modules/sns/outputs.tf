output "sns_topic_arn" {
  description = "ARN of the SNS topic"
  value       = aws_sns_topic.budget_tracker_topic.arn
}
