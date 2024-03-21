
module "test" {
    source = "./module" 
    ami       	= "ami-02d7fd1c2af6eead0"
    instance_type = "t2.micro"
    subnet_id 	= "subnet-0cdc37180788948e1"
    key_name  	= "nit"
    name        = "test_ec2"
}
