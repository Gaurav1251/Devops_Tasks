# EC2 Instance and S3 Bucket Setup

File: ec2_and_s3.tf

<br>
<br>

**Overview:**

This Terraform script provisions an EC2 instance and an S3 bucket. EC2 instances provide scalable computing power, while S3 (Simple Storage Service) is a storage service for the internet.
<br>

---

**Key Resources:**

    # Create EC2 instance
    resource "aws_instance" "t1" {
      ami = "ami-0dee22c13ea7a9a67"
      instance_type = "t2.micro"
      tags = {
        Name = "first instance"
        name = "test"
      }
      security_groups = ["default"]
      key_name = "seytan_cloud"
    }
    
    # Create S3 Bucket
    resource "aws_s3_bucket" "testgkseytan" {
      bucket = "seytangkbukket"
    }

**Instructions:**

  Install Terraform: Follow this https://developer.hashicorp.com/terraform/install?product_intent=terraform to install Terraform.

  AWS Credentials: Set up AWS credentials either in ~/.aws/credentials or using environment variables.

  Deploy the Resources:
        Initialize the directory:

           terraform init

  Plan the deployment:


    terraform plan

  Apply the deployment:

    terraform apply

  Outputs:

    EC2 Instance: A running instance on AWS.
    S3 Bucket: A new S3 bucket named seytangkbukket.
