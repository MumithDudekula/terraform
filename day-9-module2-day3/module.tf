
module "test" {
    source = "./module-directory"
    ami ="ami-02d7fd1c2af6eead0"
    instance ="t2.micro"
    key_name ="nit"
}