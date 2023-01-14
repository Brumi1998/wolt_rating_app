resource "aws_dynamodb_table" "wolt_rating_table" {
  name     = "rateings"
  hash_key = "http"
  range_key = "org_id"

  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "org_id"
    type = "S"
  }

  attribute {
      name = "http"
      type = "S"
  }
}
