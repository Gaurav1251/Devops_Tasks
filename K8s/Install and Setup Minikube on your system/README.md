# Minikube Essentials: Installation and Setup on Ubuntu

**Overview**

This guide covers the installation and setup of Minikube on an Ubuntu system. Minikube allows you to run a single-node Kubernetes cluster locally, enabling developers to experiment with Kubernetes applications in a lightweight environment.

---
**Prerequisites**

    Basic knowledge of Linux and SSH.
    An EC2 instance with Ubuntu or a local Ubuntu machine.

**Steps to Install Minikube**

    Launch an EC2 Instance
        Create an EC2 t2.medium instance or use any Ubuntu machine.

    SSH into the Instance

        ssh -i "your-key.pem" ubuntu@<ec2-public-ip>

**Install Minikube**

    Download and install Minikube:

    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
    sudo install minikube-linux-amd64 /usr/local/bin/minikube
    rm minikube-linux-amd64

**Install Docker**

    Minikube requires Docker to run containers:

    sudo apt-get update
    sudo apt-get install docker.io -y
    sudo usermod -aG docker $USER
    newgrp docker

**Start Minikube**

    Start Minikube using Docker as the driver:

    minikube start --driver=docker

**Check Minikube Status**

    minikube status

**Setup Alias for Kubectl**

    Set an alias for kubectl to easily manage the cluster:

    alias kubectl="minikube kubectl --"

**Verification**

    After installation, check the status by running:

    minikube status
---
**Basic Minikube Commands**

Start interacting with the cluster using the following commands:

    Get Cluster Info:
    kubectl cluster-info

Get All Nodes:

    kubectl get nodes

Stop Minikube:

    minikube stop


**For more Minikube-specific commands, refer to the official documentation.**

---

**Conclusion**

By following this guide, you will have Minikube and Docker installed on your Ubuntu system, allowing you to test Kubernetes applications locally.

