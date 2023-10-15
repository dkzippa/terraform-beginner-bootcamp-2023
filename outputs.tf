# output "bucket_name" {
#     description = "bucket name output"
#     value = module.terrahouse_aws.bucket_name
# }
# output "website_endpoint" {
#     description = "s3 static webste endpoint"
#     value = module.terrahouse_aws.website_endpoint
# }
# output "index_html_exists" {
#     description = "test index_html_exists"
#     value = fileexists("${path.root}/public/index.html")
# }
output "film_website_url" {
    value = module.terrahouse_test_website.cloudfront_url
}


output "test_website_url" {
    value = module.terrahouse_film_website.cloudfront_url
}

