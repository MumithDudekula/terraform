
variable "ami" {
  type    = string
  default = "ami-02d7fd1c2af6eead0"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "tags" {
  type    = list(string)
  default = ["testt","devt"]
}
variable "subnet_id" {
    type = string
    default = "subnet-0cdc37180788948e1"
  
}
resource "aws_instance" "sandbox" {
  ami           = var.ami
  instance_type = var.instance_type
  for_each      = toset(var.tags)
  subnet_id = var.subnet_id
#   count = length(var.tags)
  tags = {
    Name = each.value # for a set, each.value and each.key is the same
  }
}
