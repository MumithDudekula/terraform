variable "ami_id" {
  description = "ami id"
  type = string
  default = "ami-033a1ebf088e56e81"
}

variable "instance_type" {
  description = "instance type"
  type = string
  default = "t3.micro"
}

variable "key_name" {
  description = "key name"
  type = string
  default = "nit"
}
