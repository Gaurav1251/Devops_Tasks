# IAM Users and Groups Setup

File: iam.tf
<br>

**Overview:**

This Terraform script creates IAM users, an IAM group, and assigns the users to the group. IAM (Identity and Access Management) is used to securely manage access to AWS services.
<br><br>

**Key Resources:**

    # Create IAM users
    resource "aws_iam_user" "g1"  {
      name = "gk"
    }
    
    resource "aws_iam_user" "g2" {
      name = "shivam"
    }
    
    resource "aws_iam_user" "g3" {
      name = "rushi"
    }
    
    # Create IAM group
    resource "aws_iam_group" "pune" {
      name = "pune"
    }
    
    # Add users to the group
    resource "aws_iam_group_membership" "pune" {
      name  = "pune"
      users = [aws_iam_user.g1.name, aws_iam_user.g2.name, aws_iam_user.g3.name]
      group = aws_iam_group.pune.name
    }


---

**Instructions:**

    Install Terraform: Make sure Terraform is installed. Use this guide if needed.

    AWS Credentials: Ensure you have valid AWS credentials configured.

  Execute Terraform:
      Initialize the directory:

        terraform init

  Preview changes:

    terraform plan

  Apply the script:

    terraform apply

  Outputs:

    IAM users: gk, shivam, rushi
    Group: pune with all users added to it.
