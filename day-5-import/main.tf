resource "aws_instance" "dev" {
  ami = "ami-02d7fd1c2af6eead0"
  instance_type = "t2.micro"
  tags = {
    Name = "server-day5"
  }
}