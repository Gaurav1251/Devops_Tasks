module "ec2" {
  source = "./modules/ec2"
  ami_id = var.ami_id
  instance_type = var.instance_type
  key = var.key
}

module "vpc" {
  source = "./modules/vpc"
  vpc_cidr_block = var.vpc_cidr_block
  aws_subnet = var.aws_subnet
  az = var.az
  port_no = var.port_no
  
}


