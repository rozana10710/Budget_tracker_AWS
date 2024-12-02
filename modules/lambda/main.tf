resource "aws_lambda_function" "budget_tracker_function" {
  function_name = var.function_name
  runtime       = "python3.9"
  handler       = var.handler
  role          = var.lambda_role_arn
  filename      = var.lambda_zip_file

  environment {
    variables = {
      DYNAMODB_TABLE = var.dynamodb_table_name
      SNS_TOPIC_ARN  = var.sns_topic_arn
    }
  }

  tags = {
    Environment = var.environment
    Project     = "BudgetTracker"
  }
}

resource "aws_lambda_permission" "api_gateway_invoke" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.budget_tracker_function.function_name
  principal     = "apigateway.amazonaws.com"
}
