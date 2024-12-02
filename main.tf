provider "aws" {
  region = var.aws_region
}


module "iam" {
  source    = "./modules/iam"
  role_name = "budget-tracker-lambda-role"
}

output "lambda_role_arn" {
  value = module.iam.role_arn
}


module "dynamodb" {
  source         = "./modules/dynamodb"
  table_name     = "BudgetTrackerTable"
  partition_key  = "user_id"
  sort_key       = "timestamp"
  sort_key_enabled = true
  environment    = "dev"
}

output "dynamodb_table_name" {
  value = module.dynamodb.table_name
}

output "dynamodb_table_arn" {
  value = module.dynamodb.table_arn
}

module "sns" {
  source      = "./modules/sns"
  topic_name  = "BudgetTrackerTopic"
  environment = "dev"
}

module "lambda" {
  source               = "./modules/lambda"
  function_name        = "BudgetTrackerFunction"
  handler              = "lambda_function.lambda_handler"
  lambda_zip_file      = "lambda_code.zip"
  lambda_role_arn      = module.iam.role_arn
  dynamodb_table_name  = module.dynamodb.table_name
  sns_topic_arn        = module.sns.sns_topic_arn
  environment          = "dev"
  lambda_exec_role_arn = module.iam.role_arn
}

output "lambda_function_name" {
  value = module.lambda.lambda_function_name
}

output "lambda_function_arn" {
  value = module.lambda.lambda_function_arn
}

output "sns_topic_arn" {
  value = module.sns.sns_topic_arn
}

module "api_gateway" {
  source              = "./modules/api_gateway"
  api_name            = "BudgetTrackerAPI"
  resource_path      = "expense"
  http_method        = "POST"
  lambda_function_arn = module.lambda.lambda_function_arn
  stage_name         = "dev"
}


output "api_url" {
  value = module.api_gateway.api_url
}

