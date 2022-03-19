terraform {
  backend "s3" {
    bucket = "sukipi-tfstate"
    key    = "terraform.tfstate"
    region = "ap-northeast-1"
  }
}

resource "aws_s3_bucket" "tfstate" {
  bucket = "sukipi-tfstate"

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_acl" "tfstate" {
  bucket = aws_s3_bucket.tfstate.id
  acl    = "private"
}

resource "aws_s3_bucket_public_access_block" "tfstate" {
  bucket = aws_s3_bucket.tfstate.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tfstate" {
  bucket = aws_s3_bucket.tfstate.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
