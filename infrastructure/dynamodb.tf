resource "aws_dynamodb_table" "wolt_rating_table" {
  name      = "rateings"
  hash_key  = "http"
  range_key = "org_id"

  attribute {
    name = "http"
    type = "S"
  }

  attribute {
    name = "org_id"
    type = "S"
  }
}
