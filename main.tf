terraform {
    required_providers {
        terratowns = {
            source = "local.providers/local/terratowns"
            version = "1.0.0"
        }
    }
#  cloud {
#    organization = "zip-all"
#    workspaces {
#      name = "terrahouse-01"
#    }
#  }
}


#module "terrahouse_aws" {
#    source = "./modules/terrahouse_aws"
#    bucket_name = var.bucket_name
#    user_uuid = var.user_uuid
#    content_version = var.content_version
#}
#



provider "terratowns" {
    endpoint = var.api_endpoint
    token = var.bearer_token
    user_uuid = var.user_uuid
}

