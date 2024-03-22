# create instance 

resource "aws_instance" "dev" {
    ami = var.ami
    instance_type = var.instance
    subnet_id = var.subent
    
    key_name = var.key_name
    tags = {
      Name = "dev-ec2"
    }
}