resource "aws_s3_bucket" "deploy" {
  bucket = var.bucket_name
  acl    = var.acl_value
}