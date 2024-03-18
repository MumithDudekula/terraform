resource "aws_instance" "mumi" {
  ami             = "ami-02d7fd1c2af6eead0"
  instance_type   = "t2.micro"
  key_name        = "nit"
  subnet_id       = aws_subnet.prod.id
  security_groups = [aws_security_group.custom_sg.id]

  tags = {
    Name = "dev_ec2_day3"
  }
}