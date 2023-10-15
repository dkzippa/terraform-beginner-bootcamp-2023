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


module "terrahouse_aws" {
    source = "./modules/terrahouse_aws"
    bucket_name = var.bucket_name
    user_uuid = var.user_uuid
    content_version = var.content_version
}




locals {
    # domain_name = "d13yttg7j4uclr.cloudfront.net"
    town = "missingo"
    # town = "gamers-grotto"
    api_endpoint = "https://terratowns.cloud/"
    # api_endpoint = "http://127.0.0.1:4567"    
} 

provider "terratowns" {
    endpoint = local.api_endpoint
    token = var.bearer_token
    user_uuid = var.user_uuid
}


resource "terratowns_home" "home" {
    name = "Hey Missingo!"
    description = "A sacred place to test the new Home. Nearly completed the TF Bootcamp..."    
    # domain_name = local.domain_name
    domain_name = module.terrahouse_aws.cloudfront_url
    town = local.town
    content_version = 1
    depends_on = [ module.terrahouse_aws ]
}
