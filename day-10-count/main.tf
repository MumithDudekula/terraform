#example1:without list varaible
#Day-10-count

resource "aws_instance" "myec2" {

  ami = "ami-02d7fd1c2af6eead0"
  instance_type = "t3.micro"
  count = 2
  tags = {
    Name = "webec2-${count.index}"
  }
}




