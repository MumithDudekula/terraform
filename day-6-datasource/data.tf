data "aws_security_group" "mysg" {
    id = "sg-00e4e67b99951dbc1"
    
   
}

data "aws_subnet" "mysubnet" {
    id = "subnet-0cdc37180788948e1"
  
}

data "aws_ami" "amzlinux" {
  most_recent = true
  owners = [ "amazon" ]
  filter {
    name = "name"
    values = [ "amzn2-ami-hvm-*-gp2" ]
  }
  filter {
    name = "root-device-type"
    values = [ "ebs" ]
  }
  filter {
    name = "virtualization-type"
    values = [ "hvm" ]
  }
  filter {
    name = "architecture"
    values = [ "x86_64" ]
  }
}
