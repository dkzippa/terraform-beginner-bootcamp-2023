output "bucket_name" {
  description = "s3 bucket name"
  value = aws_s3_bucket.website_bucket.bucket
}

output "website_endpoint" {
  description = "endpoint for static website"
  value = aws_s3_bucket_website_configuration.website_configuration.website_endpoint
}
