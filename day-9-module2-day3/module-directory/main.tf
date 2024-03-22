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