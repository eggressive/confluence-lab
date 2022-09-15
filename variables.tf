#Variables
variable "key_name" {
  type    = string
  default = "ec2_key"
}

variable "ssh_port" {
  description = "The port the server will use for SSH requests"
  type        = number
  default     = 22
}

variable "bucket_name" {
  type    = string
  default = "confluences3bucket"
}

variable "acl_value" {
  default = "private"
}