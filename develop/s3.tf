resource "aws_s3_bucket" "asset" {
    bucket = "sukipi-bucket-${var.env}"
}
