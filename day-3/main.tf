
#create VPC
resource "aws_vpc" "prod" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "producton"
  }
}
#create internet gateway and attach to vpc
resource "aws_internet_gateway" "prod" {
  vpc_id = aws_vpc.prod.id #IG attach block to vpc

}

#create subnets
resource "aws_subnet" "prod" {
  cidr_block = "10.0.0.0/24"
  vpc_id     = aws_vpc.prod.id #subnet attach block yo vpc

}


#cretae Route tables & attach internet gateway to Rt

resource "aws_route_table" "prod" {
  vpc_id = aws_vpc.prod.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.prod.id #attache block ig to rt

  }

}
#subent associations
resource "aws_route_table_association" "name" {
  route_table_id = aws_route_table.prod.id #rout table association rt attach
  subnet_id      = aws_subnet.prod.id      #rt association to subnet

}

resource "aws_security_group" "custom_sg" {
  name   = "allow_tls"
  vpc_id = aws_vpc.prod.id
  tags = {
    Name = "dev_sg"
  }
  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]

  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }


}


