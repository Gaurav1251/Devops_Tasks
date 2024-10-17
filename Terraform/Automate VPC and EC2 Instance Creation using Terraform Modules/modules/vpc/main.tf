resource "aws_vpc" "myvpc" {
  cidr_block = var.vpc_cidr_block

}
resource "aws_subnet" "pub1" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = var.aws_subnet[0]
  tags = {
    Name="public"
  }
  availability_zone = var.az[0]
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



resource "aws_security_group" "sg" {
  vpc_id = aws_vpc.myvpc.id

  ingress {

    from_port=var.port_no[0]
    to_port=var.port_no[0]
    cidr_blocks=["0.0.0.0/0"]
    protocol="tcp"
    
  }

  egress {
    from_port=var.port_no[1]
    to_port=var.port_no[1]
    protocol="-1"
    cidr_blocks=["0.0.0.0/0"]
  }
}
