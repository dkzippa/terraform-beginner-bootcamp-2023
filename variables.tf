variable "user_uuid" {
    type = string

}

variable "bearer_token" {
    type = string
}

variable "api_endpoint" {
    type = string
}

variable "test_website" {
  type = object({
    bucket_name = string
    webroot_path = string    
    town = string    
    content_version = number
  })
}

variable "film_website" {
  type = object({
    bucket_name = string
    webroot_path = string
    town = string    
    content_version = number
  })
  }
