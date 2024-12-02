output "table_name" {
  description = "Name of the DynamoDB table"
  value       = aws_dynamodb_table.expenses_table.name
}

output "table_arn" {
  description = "ARN of the DynamoDB table"
  value       = aws_dynamodb_table.expenses_table.arn
}
