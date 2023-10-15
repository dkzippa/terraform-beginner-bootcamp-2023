terraform {
    required_providers {
        terratowns = {
            source = "local.providers/local/terratowns"
            version = "1.0.0"
        }
    }
 cloud {
   organization = "zip-all"
   workspaces {
     name = "tf-bootcamp-terrahouse"
   }
 }
}



provider "terratowns" {
    endpoint = var.api_endpoint
    token = var.bearer_token
    user_uuid = var.user_uuid
}



module "terrahouse_test_website" {
    source = "./modules/terrahouse_aws"
    bucket_name = var.test_website.bucket_name
    webroot_path =  var.test_website.webroot_path
    user_uuid = var.user_uuid
    content_version = var.test_website.content_version
}


module "terrahouse_film_website" {
    source = "./modules/terrahouse_aws"
    bucket_name = var.film_website.bucket_name
    webroot_path =  var.film_website.webroot_path
    user_uuid = var.user_uuid
    content_version = var.film_website.content_version
}




resource "terratowns_home" "home_test" {
    name = "Hey Missingo!"
    description = "A sacred place to test the new Home. Nearly completed the TF Bootcamp..."    
    # domain_name = local.domain_name
    domain_name = module.terrahouse_test_website.cloudfront_url
    town = var.test_website.town
    content_version = var.test_website.content_version
    depends_on = [ module.terrahouse_test_website ]
}

resource "terratowns_home" "home_film" {
    name = "The Thomas Crown Affair"
    description = "The Thomas Crown Affair is a 1999 American romantic heist film directed by John McTiernan, written by Leslie Dixon and Kurt Wimmer and is a remake of the 1968 film of the same name. Its story follows Thomas Crown, a billionaire who steals a painting from an art gallery and is pursued by an insurance investigator with the two falling in love"
    domain_name = module.terrahouse_film_website.cloudfront_url
    town = var.film_website.town
    content_version = var.film_website.content_version
    depends_on = [ module.terrahouse_film_website ]
}
