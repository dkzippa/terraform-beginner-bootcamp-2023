terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "5.20.0"
        }
    }
}

provider "aws" {
    region = "us-east-1"
}



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
  etag = filemd5("${path.cwd}/public/index.html")
  count = fileexists("${path.root}/public/index.html") ? 1 : 0
}

resource "aws_s3_object" "upload_error" { 
  key = "error.html"
  bucket = aws_s3_bucket.website_bucket.bucket
  source = "${path.root}/public/error.html"
  etag = filemd5("${path.root}/public/error.html")
  count = fileexists("${path.root}/public/error.html") ? 1 : 0
}

