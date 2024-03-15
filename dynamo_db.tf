resource "aws_dynamodb_table" "terraform_lock_table" {
  name         = var.terraform_lock_dynamo_db_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    owner = "infrastructure"
  }
}


