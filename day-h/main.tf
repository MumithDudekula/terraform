# Define the AWS provider configuration.
provider "aws" {
  region = "us-east-1"  # Replace with your desired AWS region.
}


resource "aws_key_pair" "sample" {
  key_name   = "nit1"  # Replace with your desired key name
  public_key = file("C:/Users/Mumith D/.ssh/id_rsa.pub") 

}

resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "mysubdef" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "myig" {
  vpc_id = aws_vpc.myvpc.id
}

resource "aws_route_table" "rgdef" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myig.id
  }
}

resource "aws_route_table_association" "RT" {
  subnet_id      = aws_subnet.mysubdef.id
  route_table_id = aws_route_table.rgdef.id
}

resource "aws_security_group" "mysg" {
  name   = "dub"
  vpc_id = aws_vpc.myvpc.id

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "mysg2"
  }
}

resource "aws_instance" "server" {
  ami                    = "ami-02d7fd1c2af6eead0"
  instance_type          = "t2.micro"
  key_name      = aws_key_pair.sample.key_name
  vpc_security_group_ids = [aws_security_group.mysg.id]
  subnet_id              = aws_subnet.mysubdef.id

  connection {
    type        = "ssh"
    user        = "ec2-user"  # Replace with the appropriate username for your EC2 instance
    # private_key = file("C:/Users/veerababu/.ssh/id_rsa")
    private_key = file("C:/Users/Mumith D/.ssh/id_rsa")  #private key path
    host        = self.public_ip
  }

  # local execution procee 
 provisioner "local-exec" {
    command = "touch file007"
   
 }
  # File provisioner to copy a file from local to the remote EC2 instance
  provisioner "file" {
    source      = "file222"  # Replace with the path to your local file
    destination = "/home/ec2-user/file222"  # Replace with the path on the remote instance
  }
  # remote execution process 
  provisioner "remote-exec" {
    inline = [
"touch file999",
"echo hello from aws >> file999",
]
 }

}