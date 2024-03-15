resource "aws_s3_bucket" "bucket" {
  bucket = "bucket-15032024"
}

resource "aws_dynamodb_table" "table" {
  name = "locker"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20
  attribute {
    name = "LockID"
    type = "S"
  }
}