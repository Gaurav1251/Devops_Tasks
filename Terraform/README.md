# Terraform Tasks

This folder contains various tasks related to Terraform, an open-source tool for automating infrastructure management using Infrastructure as Code (IaC). Each task is designed to help you understand Terraform concepts and apply them in practical scenarios.

---
**📁 Folder Structure**

    Terraform/
    │
    ├── Task-1/
    │   ├── script.tf         # Script for Task-1 
    │   ├── README.md         # Instructions for Task-1
    │   └── demonstration.pdf # PDF demonstration for Task-1 (if applicable)
    │
    ├── Task-2/
    │   ├── script.tf         # Script for Task-2 
    │   ├── README.md         # Instructions for Task-2
    │   └── demonstration.pdf # PDF demonstration for Task-2 (if applicable)
    │
    └── README.md             # Overview of Terraform-related tasks
    └── terraform_commands.pdf # Essential Terraform commands

**Each task has its own folder containing:**

    README.md: Detailed instructions for performing the task.
    script.tf : A script to automate parts of the task.
    demonstration.pdf (if applicable): Visual guide or demo of the task.

**🚀 Tasks Overview**

       1. EC2 Instance and S3 Bucket Setup : This Terraform script provisions an EC2 instance and an S3 bucket. EC2 instances provide scalable computing power, while S3 (Simple Storage Service) is a storage service for the internet.

       2. IAM Users and Groups Setup : This Terraform script creates IAM users, an IAM group, and assigns the users to the group. IAM (Identity and Access Management) is used to securely manage access to AWS services.

       3. VPC and RDS Setup : This Terraform script sets up a Virtual Private Cloud (VPC) with both public and private subnets, an Internet Gateway (IGW), a NAT Gateway, and an Amazon RDS (MySQL) instance within the private subnet.

    
  Note: More tasks will be added as we explore additional Terraform use cases.

**🛠 Prerequisites**

Before working on the tasks, ensure the following:

    Terraform is installed on your system (if not, follow the setup instructions in the Terraform Installation Guide) 
https://developer.hashicorp.com/terraform/install?product_intent=terraform#linux.
    
    You have basic knowledge of Terraform commands (e.g., terraform init, terraform apply, terraform plan).
    AWS CLI is configured if you’re working with AWS infrastructure.
---
**🔄 How to Run the Tasks**

  Navigate to the Task Folder:
   
    cd Terraform/Task-1/

**Read the Instructions: Open the README.md in the task folder and follow the steps.**

    Run the Scripts (if applicable): If the task includes a script (script.tf), you can execute it:

    terraform apply -auto-approve

 **Refer to the PDF: If provided, view the demonstration.pdf for a visual guide.**

 
 ---
**💡 Tips**

    Experiment: Modify the scripts and Terraform configurations to customize your deployments.
    Documentation: Refer to the Terraform documentation to explore more advanced features.
    Commands: Use terraform plan to preview changes before applying, and terraform apply to execute them.

