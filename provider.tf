provider "aws" {
  access_key = ""
  secret_key = ""
  region     = "us-east-1"
}

module "s3" {
  source      = "./s3"
  bucket_name = var.bucket_name
}