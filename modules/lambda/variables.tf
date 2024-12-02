variable "function_name" {
  description = "Name of the Lambda function"
  default     = "BudgetTrackerFunction"
}

variable "handler" {
  description = "Handler function for the Lambda function"
  default     = "lambda_function.lambda_handler"
}

variable "lambda_zip_file" {
  description = "Path to the zip file containing Lambda code"
  default     = "lambda_code.zip"
}

variable "lambda_role_arn" {
  description = "IAM Role ARN for Lambda execution"
}

variable "dynamodb_table_name" {
  description = "DynamoDB table name for the Lambda function to interact with"
}

variable "sns_topic_arn" {
  description = "SNS topic ARN for sending notifications"
}

variable "environment" {
  description = "Tag to define the environment (e.g., dev, prod)"
  default     = "dev"
}

variable "lambda_exec_role_arn" {
  description = "The ARN of the IAM role for the Lambda function"
  type        = string
}
