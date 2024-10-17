# Automate VPC and EC2 Instance Creation using Terraform Variables

This task involves automating the creation of a Virtual Private Cloud (VPC) and launching an EC2 instance in AWS using Terraform. The configuration utilizes variables to enhance flexibility and ease of customization.

---

## Files

- **vpc_and_ec2_using_variables.tf**: Main Terraform configuration for creating the VPC and EC2 instance.
- **variables.tf**: Definition of variables used in the Terraform configuration.
- **terraform.tfvars**: Values for the variables defined in `variables.tf`.

## Prerequisites

- Terraform installed on your machine.
- AWS CLI configured with your credentials.
- Sufficient IAM permissions to create VPC and EC2 instances.

## Usage

1. **Initialize Terraform:**
    ```
    terraform init
    ```

2. **Plan the infrastructure:**
    ```
    terraform plan
    ```

3. **Apply the configuration to create the resources:**
    ```
    terraform apply
    ```

4. **Verify the resources in the AWS Management Console.**

## Variables

The following variables are defined in `variables.tf` and their values should be set in `terraform.tfvars`:

- **vpc_cidr**: The CIDR block for the VPC.
- **subnet_cidr**: The CIDR block for the subnet.
- **instance_type**: The type of EC2 instance to launch.
- **key_name**: The name of the key pair to use for the EC2 instance.
- **ami_id**: The ID of the AMI to use for the EC2 instance.

---

Example `terraform.tfvars`:

    vpc_cidr = "10.0.0.0/16"
    subnet_cidr = "10.0.1.0/24"
    instance_type = "t2.micro"
    key_name = "my-key-pair"
    ami_id = "ami-0c55b159cbfafe1f0"

**Cleaning Up**

To destroy the resources created by this task, run:

    terraform destroy

**Notes**

    Ensure the AMI ID provided is valid for your region.
    Update the security group rules as per your requirements in the vpc_and_ec2_using_variables.tf file.
