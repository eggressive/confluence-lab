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
