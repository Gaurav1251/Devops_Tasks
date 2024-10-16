/*

day 3

resource "aws_vpc" "test" {
  cidr_block = "192.168.0.0/22"
  tags = {
    Name="test"
  }
}

resource "aws_subnet" "sub" {
  availability_zone = "ap-south-1a"
  vpc_id = aws_vpc.test.id
  cidr_block = "192.168.0.0/26"
  tags = {
    Name="pub"
  }
  


}

resource "aws_internet_gateway" "igw" {
  tags = {
    Name="igw"
  }
}
resource "aws_internet_gateway_attachment" "igw_a" {
  internet_gateway_id = aws_internet_gateway.igw.id
  vpc_id = aws_vpc.test.id



}

resource "aws_route" "rt" {
  route_table_id = aws_vpc.test.main_route_table_id
  
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id

}
resource "aws_vpc_security_group_ingress_rule" "in" {
  
  ip_protocol = "tcp"
  security_group_id = aws_vpc.test.default_security_group_id
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 22
  to_port = 22
}


resource "aws_instance" "hey1" {
  ami = "ami-0dee22c13ea7a9a67"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.sub.id
  vpc_security_group_ids = [aws_vpc.test.default_security_group_id]
  key_name = "seytan_cloud"
  associate_public_ip_address = true
}


resource "aws_subnet" "private1" {
  availability_zone = "ap-south-1a"
  vpc_id = aws_vpc.test.id
  cidr_block = "192.168.0.64/26"
  tags = {
    Name="private1"
  }
  map_public_ip_on_launch = false


}
resource "aws_eip" "eip" {
  domain = "vpc"
}
resource "aws_nat_gateway" "nat" {
    subnet_id = aws_subnet.sub.id
    allocation_id = aws_eip.eip.id

}

resource "aws_subnet" "private2" {
  availability_zone = "ap-south-1a"
  vpc_id = aws_vpc.test.id
  cidr_block = "192.168.0.128/26"
  tags = {
    Name="private2"
  }
  map_public_ip_on_launch = false


}
resource "aws_route_table" "priv2" {
    vpc_id = aws_vpc.test.id
  tags = {
    Name="private"
  }

}
resource "aws_route" "rtp2" {
  route_table_id = aws_route_table.priv2.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.nat.id
}
resource "aws_route_table_association" "rtpp1" {
    route_table_id = aws_route_table.priv2.id
  subnet_id = aws_subnet.private1.id

  
}
resource "aws_route_table_association" "rtpp2" {
    route_table_id = aws_route_table.priv2.id
  subnet_id = aws_subnet.private2.id
  

}




resource "aws_instance" "p11" {
  ami = "ami-0dee22c13ea7a9a67"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.private1.id
  vpc_security_group_ids = [aws_vpc.test.default_security_group_id]
  key_name = "seytan_cloud"
  tags = {
    Name="p1"
  }
  
}
resource "aws_instance" "p12" {
  ami = "ami-0dee22c13ea7a9a67"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.private1.id
  vpc_security_group_ids = [aws_vpc.test.default_security_group_id]
  key_name = "seytan_cloud"
  
}


resource "aws_db_instance" "rds" {
  allocated_storage = 20
  engine = "mysql"
  engine_version = "8.0.39"
  port = 3306
  username = "admi"
  password = "12345678"
  instance_class = "db.t3.micro"
  db_subnet_group_name = aws_db_subnet_group.db_grp.name
  skip_final_snapshot = true
}



resource "aws_subnet" "rds" {
  availability_zone = "ap-south-1a"
  vpc_id = aws_vpc.test.id
  cidr_block = "192.168.0.192/26"
  tags = {
    Name="rds"
  }
  


}
resource "aws_subnet" "rds1" {
  availability_zone = "ap-south-1b"
  vpc_id = aws_vpc.test.id
  cidr_block = "192.168.1.0/26"
  tags = {
    Name="rds1"
  }
  


}
resource "aws_subnet" "rds2" {
  availability_zone = "ap-south-1c"
  vpc_id = aws_vpc.test.id
  cidr_block = "192.168.1.64/26"
  tags = {
    Name="rds2"
  }
  


}

resource "aws_db_subnet_group" "db_grp" {
    name = "test"
  subnet_ids = [aws_subnet.sub.id,aws_subnet.rds1.id,aws_subnet.rds2.id]

}
*/