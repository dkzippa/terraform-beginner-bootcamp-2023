resource "aws_s3_bucket" "website_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = "TF Bootcamp test bucket"
    Environment = "Dev"
    UserUid     = var.user_uuid
  }
}
