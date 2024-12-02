output "api_url" {
  description = "The URL of the API Gateway endpoint"
  value       = "https://${aws_api_gateway_rest_api.budget_tracker_api.id}.execute-api.${var.region}.amazonaws.com/${var.stage_name}/${var.resource_path}"
}
