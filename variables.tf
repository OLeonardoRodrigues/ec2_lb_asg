variable "aws_region" {
  description = "(Optional) Define what region the instance will be deployed"

  type    = string
  default = "us-east-1"
}

variable "instance_type" {
  description = "(Optional) AWS Instance type defines the hardware configuration of the machine."

  type     = string
  nullable = false
  default  = "t2.micro"
}

variable "instance_ami" {
  description = "(Optional) Instance's AMI."

  type     = string
  nullable = false
  default  = "ami-0ca7a41b0cf690c29"
}

variable "name" {
  description = "(Optional) Name of the application."

  type     = string
  nullable = false
  default  = "server-nginx"
}

variable "template_key_name" {
  description = "(Optional) Name of the template key."

  type     = string
  nullable = false
  default  = "carlos_daniel"
}
