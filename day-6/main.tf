resource "aws_instance" "server123" {
    ami = data.aws_ami.amzlinux.id
    instance_type = "t2.micro"
    key_name = "nit"
    subnet_id = data.aws_subnet.mysubnet.id
    security_groups = [data.aws_security_group.mysg.id]

    tags = {
      Name = "server123"
    }
}