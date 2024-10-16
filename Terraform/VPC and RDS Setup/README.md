# VPC and RDS Setup

**File: vpc_rds_.tf**

**Overview:**

This Terraform script sets up a Virtual Private Cloud (VPC) with both public and private subnets, an Internet Gateway (IGW), a NAT Gateway, and an Amazon RDS (MySQL) instance within the private subnet.
<br><br>

---
**Architecture:**

    VPC with CIDR block 192.168.0.0/22.
    Public Subnet for instances requiring internet access.
    Private Subnets for secure resources such as the RDS instance.
    Internet Gateway (IGW) to allow public subnet instances to communicate with the internet.
    NAT Gateway to allow private subnet instances to access the internet without exposing them publicly.
    RDS (MySQL) for database services, placed in private subnets.

**Key Resources:**

    # Create a VPC
    resource "aws_vpc" "test" {
      cidr_block = "192.168.0.0/22"
      tags = { Name = "test" }
    }
    
    # Create a public subnet
    resource "aws_subnet" "sub" {
      availability_zone = "ap-south-1a"
      vpc_id = aws_vpc.test.id
      cidr_block = "192.168.0.0/26"
      tags = { Name = "pub" }
    }
    
    # Internet Gateway
    resource "aws_internet_gateway" "igw" {
      vpc_id = aws_vpc.test.id
      tags = { Name = "igw" }
    }
    
    # Create a MySQL RDS Instance in private subnet
    resource "aws_db_instance" "rds" {
      allocated_storage = 20
      engine = "mysql"
      engine_version = "8.0.39"
      instance_class = "db.t3.micro"
      username = "admin"
      password = "12345678"
      db_subnet_group_name = aws_db_subnet_group.db_grp.name
    }

**Instructions:**

  Install Terraform: Download and install Terraform from the official site.

  AWS Credentials: Set your AWS credentials by configuring ~/.aws/credentials or setting environment variables:

    export AWS_ACCESS_KEY_ID=your-access-key-id
    export AWS_SECRET_ACCESS_KEY=your-secret-access-key

  Initialize Terraform:

    terraform init

  Plan and Apply:

  Preview the changes:

     terraform plan

  Apply the changes:

    terraform apply

  Outputs:

    VPC with public and private subnets.
    An RDS instance running MySQL in the private subnet.
