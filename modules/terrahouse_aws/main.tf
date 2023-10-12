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


