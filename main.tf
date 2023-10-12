terraform {
#  cloud {
#    organization = "zip-all"
#    workspaces {
#      name = "terrahouse-01"
#    }
#  }
}

module "terrahouse_aws" {
    source = "./modules/terrahouse_aws"
    bucket_name = var.bucket_name
    user_uuid = var.user_uuid
}