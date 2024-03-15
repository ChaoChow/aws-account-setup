resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket = var.terraform_state_bucket_name

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    owner = "infrastructure"
  }
}

resource "aws_s3_bucket_versioning" "terraform_state_bucket_versioning" {
  bucket = aws_s3_bucket.terraform_state_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_kms_key" "terraform_state_bucket_key" {
  description             = "Used to encrypt contents of ${var.terraform_state_bucket_name} bucket"
  deletion_window_in_days = 30
}

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state_bucket_bucket_encryption" {
  bucket = aws_s3_bucket.terraform_state_bucket.bucket

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.terraform_state_bucket_key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.terraform_state_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
