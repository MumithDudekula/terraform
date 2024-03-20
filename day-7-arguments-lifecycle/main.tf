resource "aws_instance" "test" {
    ami = "ami-02d7fd1c2af6eead0"
    instance_type = "t2.micro"
    availability_zone = "us-east-1a"
    subnet_id = "subnet-0cdc37180788948e1"
    key_name = "nit"
    
  tags = {
    Name = "test"
  }

#below examples are for lifecycle meta_arguments 

lifecycle {
    create_before_destroy = true    #this attribute will create the new object first and then destroy the old one
    }

#lifecycle {
    #prevent_destroy = true    #Terraform will error when it attempts to destroy a resource when this is set to true:
   # }


 # lifecycle {
  #  ignore_changes = [tags,] #This means that Terraform will never update the object but will be able to create or destroy it.
  #}
}