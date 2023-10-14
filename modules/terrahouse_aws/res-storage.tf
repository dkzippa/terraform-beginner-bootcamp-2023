resource "aws_s3_bucket" "website_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = "TF Bootcamp test bucket"
    Environment = "Dev"
    UserUid     = var.user_uuid
  }
}

resource "aws_s3_bucket_website_configuration" "website_configuration" {
  bucket = aws_s3_bucket.website_bucket.bucket

  index_document {
    suffix = "index.html"  
  }

  error_document {
    key = "error.html"  
  }
}


resource "aws_s3_object" "upload_index" { 
  key = "index.html"
  bucket = aws_s3_bucket.website_bucket.bucket
  source = "${path.cwd}/public/index.html"
  content_type = "text/html"
  
  etag = filemd5("${path.cwd}/public/index.html")
  lifecycle {
    ignore_changes = [ etag ]
    replace_triggered_by = [ terraform_data.content_version.output ]
  }

  count = fileexists("${path.root}/public/index.html") ? 1 : 0
}

resource "aws_s3_object" "upload_error" { 
  key = "error.html"
  bucket = aws_s3_bucket.website_bucket.bucket
  source = "${path.root}/public/error.html"
  content_type = "text/html"
  
  etag = filemd5("${path.root}/public/error.html")
  lifecycle {
    ignore_changes = [ etag ]
    replace_triggered_by = [ terraform_data.content_version.output ]
  }


  count = fileexists("${path.root}/public/error.html") ? 1 : 0
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.website_bucket.bucket
  #policy = data.aws_iam_policy_document.allow_access_from_another_account.json
  policy = jsonencode({
    "Version" = "2012-10-17",
    "Statement" = {
      "Sid" = "AllowCloudFrontServicePrincipalReadOnly",
      "Effect" = "Allow",
      "Principal" = {
        "Service" = "cloudfront.amazonaws.com"
      },
      "Action" = "s3:GetObject",
      "Resource" = "arn:aws:s3:::${aws_s3_bucket.website_bucket.id}/*",
      "Condition" = {
      "StringEquals" = {
          #"AWS:SourceArn": data.aws_caller_identity.current.arn
          "AWS:SourceArn" = "arn:aws:cloudfront::${data.aws_caller_identity.current.account_id}:distribution/${aws_cloudfront_distribution.s3_distribution.id}"
        }
      }
    }
  })
}

resource "terraform_data" "content_version" {
  input = var.content_version
}