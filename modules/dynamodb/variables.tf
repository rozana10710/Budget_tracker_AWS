variable "table_name" {
  description = "Name of the DynamoDB table"
  default     = "BudgetTrackerTable"
}

variable "partition_key" {
  description = "Partition key for the DynamoDB table"
  default     = "user_id"
}

variable "sort_key" {
  description = "Sort key for the DynamoDB table (optional)"
  default     = "timestamp"
}

variable "sort_key_enabled" {
  description = "Enable sort key for the table"
  default     = false
}

variable "environment" {
  description = "Tag to define the environment (e.g., dev, prod)"
  default     = "dev"
}
