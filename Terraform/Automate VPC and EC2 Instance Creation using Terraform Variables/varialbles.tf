variable "vpc_cidr_block" {
  type = string
}

variable "aws_subnet" {
  type = list(string)
}

variable "ami_id" {
  type = string
  
}
variable "instance_type" {
  type = string
}
variable "key" {
  type = string
}