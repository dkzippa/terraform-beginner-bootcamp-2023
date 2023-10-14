output "bucket_name" {
  description = "s3 bucket name"
  value = aws_s3_bucket.website_bucket.bucket
}

output "website_endpoint" {
  description = "endpoint for static website"
  value = aws_s3_bucket_website_configuration.website_configuration.website_endpoint
}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "caller_arn" {
  value = data.aws_caller_identity.current.arn
}

output "caller_user" {
  value = data.aws_caller_identity.current.user_id
}

output "cloudfront_url" {
  value = aws_cloudfront_distribution.s3_distribution.domain_name
}
