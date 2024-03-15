terraform {
  backend "s3" {
    bucket = "bucket-15032024"
    region = "us-east-1"
    key = "terraform.tfstate"
    dynamodb_table = "locker"
  }
}