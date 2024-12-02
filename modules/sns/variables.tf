variable "topic_name" {
  description = "Name of the SNS topic"
  default     = "BudgetTrackerTopic"
}

variable "environment" {
  description = "Tag to define the environment (e.g., dev, prod)"
  default     = "dev"
}
