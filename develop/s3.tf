resource "aws_s3_bucket" "asset" {
    bucket = "sukipi-bucket-${var.env}"
}

resource "aws_s3_bucket_acl" "asset" {
    bucket = aws_s3_bucket.asset.id
    acl = "private"
}

resource "aws_s3_bucket_public_access_block" "asset" {
  bucket = aws_s3_bucket.asset.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "asset" {
    bucket = aws_s3_bucket.asset.bucket

    rule {
        apply_server_side_encryption_by_default {
            sse_algorithm = "AES256"
        }
    }
}