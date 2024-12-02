resource "aws_sns_topic" "budget_tracker_topic" {
  name = var.topic_name

  tags = {
    Environment = var.environment
    Project     = "BudgetTracker"
  }
}
