
resource "aws_instance" "test" {
    ami = "ami-0d7a109bf30624c99"
    instance_type = "t2.micro"
    key_name = "nit"
    tags = {
      Name = "server2"
    }
  
}

resource "aws_s3_bucket" "test" {
    bucket = "rtyujiklo"
    depends_on = [aws_s3_bucket.test]
     
}
