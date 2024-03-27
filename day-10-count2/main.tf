# example-2 with variables list of string 
# Day-10-count2

variable "ami" {
  type    = string
  default = "ami-02d7fd1c2af6eead0"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "sandboxes" {
  type    = list(string)
  default = ["sandbox_server_two", "sandbox_server_three"]
}


resource "aws_instance" "sandbox" {
  ami           = var.ami
  instance_type = var.instance_type
  count         = length(var.sandboxes)

  tags = {
    Name = var.sandboxes[count.index]
  }
}
