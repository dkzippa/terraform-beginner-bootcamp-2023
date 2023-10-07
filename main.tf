terraform {
  required_providers {
    random = {
        source = "hashicorp/random"
        version = "3.5.1"
    }
    
  }
}


provider "random" {
  
}


resource "random_string" "bucket_name" {
    length = 12
    special = false
  
}

# resource "aws_s3_bucket" "aws-s3"{
#     bucket = "my-tf-test-bucket"
#     tags = {
#       Name = "s3-tf-${random_string.bucket_name.id}"
#       Environment = "Dev"
#     }
# }

output "random_bucket_name" {
    value = random_string.bucket_name.id
}

