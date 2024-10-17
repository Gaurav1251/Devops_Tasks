resource "aws_vpc" "myvpc" {
  cidr_block = var.vpc_cidr_block

}
resource "aws_subnet" "pub1" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = var.aws_subnet[0]
  tags = {
    Name="public"
  }
}



resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name="igw"
  }
}

resource "aws_route_table" "rt" {
    vpc_id = aws_vpc.myvpc.id
    tags = {
      Name="rt"
    }
    route{
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    

}
resource "aws_route_table_association" "rt_pub" {
    route_table_id = aws_route_table.rt.id
    subnet_id = aws_subnet.pub1.id
    
}




resource "aws_instance" "ec2" {
  
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key


}