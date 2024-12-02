variable "api_name" {
  description = "Name of the API"
  default     = "BudgetTrackerAPI"
}

variable "resource_path" {
  description = "The resource path for the API"
  default     = "expense"
}

variable "http_method" {
  description = "The HTTP method for the API (e.g., GET, POST)"
  default     = "POST"
}

variable "lambda_function_arn" {
  description = "The ARN of the Lambda function to be triggered by API Gateway"
}

variable "stage_name" {
  description = "Stage name for the API (e.g., dev, prod)"
  default     = "dev"
}

variable "region" {
  description = "AWS region where the API Gateway and Lambda are deployed"
  default     = "eu-north-1"
}
