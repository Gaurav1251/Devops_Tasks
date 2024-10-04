# EKS CLI Essentials: Installation and Cluster Setup on AWS

**Overview**

This guide walks through the installation of the EKS CLI (eksctl) and the creation of a Kubernetes cluster on AWS using the Amazon EKS service. It simplifies the management of Kubernetes clusters on AWS by using a set of easy commands to create, manage, and update clusters.

---
**Prerequisites**

    Basic knowledge of Linux, SSH, and Kubernetes.
    An EC2 instance with Ubuntu or a local Ubuntu machine.
    AWS CLI configured with the necessary credentials.

**Steps to Install EKS CLI**

    Launch an EC2 Instance
        Create an EC2 instance and SSH into it.

    SSH into the Instance
    
        ssh -i "your-key.pem" ubuntu@<ec2-public-ip>

**Install Kubectl**

    Install kubectl, the Kubernetes CLI tool:

        curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.31.0/2024-09-12/bin/linux/amd64/kubectl
        chmod +x ./kubectl
        mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl
        export PATH=$HOME/bin:$PATH
        kubectl version --client

**Install eksctl**

    Install EKS CLI (eksctl) for managing clusters:

        ARCH=amd64
        PLATFORM=$(uname -s)_$ARCH
        curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_$PLATFORM.tar.gz"
        tar -xzf eksctl_$PLATFORM.tar.gz -C /tmp && rm eksctl_$PLATFORM.tar.gz
        sudo mv /tmp/eksctl /usr/local/bin

**Install AWS CLI**

    Install and configure the AWS CLI:
        sudo apt-get install awscli -y
        aws configure

**Create an IAM Role for EKS**

    Create an IAM role that enables EC2 to manage your EKS cluster. Attach the role to the EC2 instance.

**Create an EKS Cluster**

    Use eksctl to create a Kubernetes cluster on AWS:

        eksctl create cluster --name my-cluster --region <region> --nodegroup-name <worker-node-name> --node-type <instance-type> --nodes <number-of-nodes> --nodes-min <min-nodes> --nodes-max <max-nodes> --managed

**Verification**

    After creating the cluster, check the status by listing the nodes:

        kubectl get nodes
---
**Basic EKS Commands**

Once your cluster is up, you can manage it with these essential commands:

    Get Cluster Info:

        kubectl cluster-info

    List Nodes:

        kubectl get nodes

Delete Cluster:

    eksctl delete cluster --name <cluster-name>

**For more commands, refer to the eksctl documentation.**

---
**Conclusion**

With this guide, you have successfully installed EKS CLI and created a Kubernetes cluster on AWS. This will help you efficiently manage Kubernetes workloads on AWS.
