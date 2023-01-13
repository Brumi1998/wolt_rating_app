resource "aws_api_gateway_rest_api" "wolt_rating" {
  name        = "wolt_rating"
  description = "API gateway for wolt_rating"

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

resource "aws_api_gateway_api_key" "wolt_rating_api_key" {
  name = "wolt_rating_api_key"
}

resource "aws_ssm_parameter" "name" {
  name      = "/wolt_rating/credential/api_key/"
  type      = "SecureString"
  value     = aws_api_gateway_api_key.wolt_rating_api_key.value
  overwrite = true
}

resource "aws_api_gateway_usage_plan" "wolt_rating" {
  depends_on  = [aws_api_gateway_rest_api.wolt_rating]
  name        = "wotlt_rating_usage_plan"
  description = "usage plan for wolt_rating"
}

resource "aws_api_gateway_usage_plan_key" "key_assigment" {
  key_id        = aws_api_gateway_api_key.wolt_rating_api_key.id
  key_type      = "API_KEY"
  usage_plan_id = aws_api_gateway_usage_plan.wolt_rating.id
}



######################################################################################



resource "aws_apigatewayv2_api" "wolt_rating_api" {
  name          = "wolt_rating_api"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_stage" "lambda_stage" {
  api_id      = aws_apigatewayv2_api.wolt_rating_api.id
  name        = "dev"
  auto_deploy = true
}
