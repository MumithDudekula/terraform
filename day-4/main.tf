resource "aws_instance" "localname" {
    ami = "ami-02d7fd1c2af6eead0"
    instance_type = "t2.micro"
    key_name = "nit"
    availability_zone = "us-east-1b"
    tags = {
      Name = "terraform"
    }
}