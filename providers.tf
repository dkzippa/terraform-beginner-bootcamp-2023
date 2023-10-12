terraform {
#  cloud {
#    organization = "zip-all"
#    workspaces {
#      name = "terrahouse-01"
#    }
#  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.20.0"
    }
  }
}

provider "random" {

}
provider "aws" {

}
