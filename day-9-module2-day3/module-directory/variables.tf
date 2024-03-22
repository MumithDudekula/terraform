variable "ami" {
    description = "passing ami value"
    type = string
    default = ""
  
}
variable "instance" {
    type = string
    default = ""
  
}
variable "key_name" {
    type = string
    default = ""
  
}
variable "subent" {
  description = "The name of the EC2 instance."
  default = ""
}