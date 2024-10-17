# Automate VPC and EC2 Instance Creation using Terraform Modules

This task automates the creation of a Virtual Private Cloud (VPC) and EC2 instance in AWS using Terraform modules. Variables are used for flexibility, enabling easy adjustments for different configurations.

<br><br>

---
**Files:**

    main.tf: Main Terraform configuration that calls the VPC and EC2 modules to create the infrastructure.
    variables.tf: Defines the variables used in the main Terraform configuration.
    terraform.tfvars: Contains the values for the variables defined in variables.tf.
    modules/: Contains module configurations for EC2 and VPC.
        modules/ec2/:
            main.tf: Terraform configuration to create an EC2 instance.
            variables.tf: Defines variables for EC2, such as AMI ID, instance type, and key name.
        modules/vpc/:
            main.tf: Terraform configuration to create a VPC, subnets, and related resources.
            variables.tf: Defines variables for VPC, such as VPC CIDR, subnets, availability zones, and ports.

**Prerequisites**

    Terraform: Installed on your machine.
    AWS CLI: Configured with your credentials.
    IAM Permissions: Sufficient permissions to create VPC and EC2 instances.

**Usage**

    Configure Variables: Edit the terraform.tfvars file to set values for your infrastructure, including:
        VPC CIDR block
        EC2 AMI ID
        Instance type
        Key pair name

  Initialize Terraform: Run the following command to initialize the project and download the necessary provider plugins:

    terraform init

  Plan the Infrastructure: Preview the actions Terraform will perform:

    terraform plan

  Apply the Configuration: Run the following command to create the VPC and EC2 instance:

    terraform apply

  After successful execution, verify the resources in the AWS Management Console.

  Cleaning Up: To destroy the created resources, run:

    terraform destroy


---

**Variables**

The following variables are defined in variables.tf and populated in terraform.tfvars:

    EC2 Module:
        ami_id: The ID of the AMI to use for the EC2 instance.
        instance_type: The type of EC2 instance (e.g., t2.micro).
        key: The key pair name for accessing the instance.

    VPC Module:
        vpc_cidr_block: The CIDR block for the VPC.
        aws_subnet: List of subnets for the VPC.
        port_no: List of port numbers for security groups.
        az: List of availability zones for the subnets.

**Example terraform.tfvars:**

    vpc_cidr_block = "10.0.0.0/16"
    aws_subnet     = ["10.0.1.0/24"]
    instance_type  = "t2.micro"
    key            = "my-key-pair"
    ami_id         = "ami-0c55b159cbfafe1f0"
    az             = ["us-west-2a"]
    port_no        = [80, 443]
---
**Notes**

    Ensure that the AMI ID provided is valid for your AWS region.
    You can modify security group rules, instance types, and other settings in the respective module configurations.
