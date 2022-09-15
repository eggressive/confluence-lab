provider "aws" {
  access_key = "AKIAUQDIWPF7WO5HCKVY"
  secret_key = "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"
  region     = "us-east-1"
}

module "s3" {
  source      = "./s3"
  bucket_name = var.bucket_name
}