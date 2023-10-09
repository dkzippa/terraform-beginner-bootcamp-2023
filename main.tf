resource "random_string" "bucket_name" {
  length  = 12
  special = false
  upper   = false
}

resource "aws_s3_bucket" "tf-s3-bucket" {
  bucket = "tf-bootcamp-bucket-${random_string.bucket_name.result}"

  tags = {
    Name        = "TF Bootcamp test bucket"
    Environment = "Dev"
    UserUid     = var.user_uuid
  }
}
