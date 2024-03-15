variable "aws_region" {
  description = "The AWS region your terraform state and lock tables will be deployed to."
  type = string
}

variable "terraform_state_bucket_name" {
  description = "Name of s3 bucket used to store terraform state"
  type = string
}

variable "terraform_lock_dynamo_db_table_name" {
  description = "Name of the dynamo DB table used to lock state while deploying new terraform."
  type = string
}
