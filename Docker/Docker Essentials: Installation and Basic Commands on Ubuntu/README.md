# Docker Essentials: Installation and Basic Commands on Ubuntu

---
**Overview**

This guide provides a step-by-step walkthrough for setting up Docker on an Ubuntu system, followed by running essential Docker commands to familiarize yourself with containerization. Docker allows developers to create, deploy, and run applications in isolated environments, simplifying the management and scaling of software.

**Prerequisites**

    Basic knowledge of Linux and SSH.
    Access to an Ubuntu system (either local or via an EC2 instance).

**Steps to Install Docker**<br>

  1. Launch an EC2 Instance
    
    Set up an Ubuntu EC2 instance on AWS or use any local Ubuntu machine.
    
  2. SSH into the Instance
    
    Use SSH to connect to the instance:
    
    ssh -i "your-key.pem" ubuntu@<ec2-public-ip>
    
  3. Install Docker<br>
    You can either create a script or manually run each of the following commands to install Docker. For manual installation:
    
    for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

    # Add Docker's official GPG key:
    sudo apt-get update -y 
    sudo apt-get install ca-certificates curl -y
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc
    
    # Add the repository to Apt sources:
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
      $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update -y
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

    
  4. Verify Docker Installation
   
    docker --version

---

**Basic Docker Commands**

  Here are some essential Docker commands to get started:

  Run a Docker container:

    docker run <image_name>

  List running containers:

    docker ps

  Stop a running container:

    docker stop <container_id>

  Remove a container:

    docker rm <container_id>

  View detailed container info:

    docker inspect <container_id>

  Execute a command inside a running container:

    docker exec -it <container_id> bash

  Remove all unused containers and images:

    docker prune

For more detailed commands, refer to the complete list in the official Docker documentation.
https://docs.docker.com/reference/cli/docker/

---

**Conclusion**

By following this guide, you will have Docker installed on your Ubuntu system and a basic understanding of core Docker commands. This will help streamline development and deployment processes by ensuring consistent environments.
