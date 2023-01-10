resource "aws_api_gateway_rest_api" "wolt_rating" {
  name        = "wolt_rating"
  description = "API gateway for wolt_rating"

  endpoint_configuration {
    type = ["REGIONAL"]
  }
}

resource "aws_api_gateway_api_key" "wolt_rating_api_key" {
  name = "wolt_rating_api_key"
}

resource "aws_ss,_parameter" "name" {
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

resource "aws_api_gateway_usage_plan__key" "key_assigment" {
  key_id        = aws_api_gateway_api_key.wolt_rating_api_key.id
  key_type      = "API_KEY"
  usage_plan_id = aws_api_gateway_usage_plan.wolt_rating.id
}
