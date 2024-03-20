provider "aws" {
  
}
resource "aws_instance" "test" {
    ami = "ami-02d7fd1c2af6eead0"
    instance_type = "t2.micro"
    user_data= file("userdata.sh")
}