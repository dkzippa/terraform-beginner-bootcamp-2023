terraform {
  cloud {
    organization = "zip-all"
    workspaces {
      name = "terrahouse-01"
    }
  }


  required_providers {
    random = {
        source = "hashicorp/random"
        version = "3.5.1"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "5.20.0"
    }
    
  }
}

provider "random" {}

resource "random_string" "bucket_name" {
    length = 12
    special = false
    upper = false
}

output "random_bucket_name" {
    value = random_string.bucket_name.result
}

resource "aws_s3_bucket" "tf-s3-bucket" {
  bucket = "tf-bootcamp-bucket-${random_string.bucket_name.result}"
  
  
  tags = {
    Name        = "TF Bootcamp test bucket"
    Environment = "Dev"
  }

}