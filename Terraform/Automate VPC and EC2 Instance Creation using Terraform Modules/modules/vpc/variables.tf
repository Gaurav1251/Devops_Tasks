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