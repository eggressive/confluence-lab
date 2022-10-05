#Secrets
variable "access_key" {
  description = "AWS Access key"
  type        = string
  sensitive   = true
}

variable "secret_key" {
  description = "AWS Secret access key"
  type        = string
  sensitive   = true
}

#Variables
variable "key_name" {
  description = "Name of the keypair"
  type        = string
  default     = "ec2_key"
}

variable "ssh_port" {
  description = "The port the server will use for SSH requests"
  type        = number
  default     = 22
}
