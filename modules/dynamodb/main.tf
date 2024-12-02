resource "aws_dynamodb_table" "expenses_table" {
  name           = var.table_name
  billing_mode   = "PAY_PER_REQUEST" # Free Tier-friendly
  hash_key       = var.partition_key
  attribute {
    name = var.partition_key
    type = "S" # String
  }
  attribute {
    name = "timestamp"
    type = "S"
  }

  # Optional sort key for multiple expenses per user (e.g., timestamp)
  dynamic "attribute" {
    for_each = var.sort_key_enabled ? [1] : []
    content {
      name = var.sort_key
      type = "N" # Number (e.g., Unix timestamp)
    }
  }

  # Add a Global Secondary Index for the timestamp attribute
  global_secondary_index {
    name            = "TimestampIndex"
    hash_key        = "timestamp"
    projection_type = "ALL" # Adjust as needed
  }

  tags = {
    Environment = var.environment
    Project     = "BudgetTracker"
  }
}
