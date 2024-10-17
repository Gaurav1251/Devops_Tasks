variable "ami_id" {
  type = string
  
}
variable "instance_type" {
  type = string
}
variable "key" {
  type = string
}
variable "vpc_cidr_block" {
  type = string
}

variable "aws_subnet" {
  type = list(string)
}

variable "port_no" {
  type = list(number)
}
variable "az" {
  type = list(string)
}