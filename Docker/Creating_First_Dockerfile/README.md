**Creating Your First Dockerfile**
---
**Overview**

This guide walks you through the steps to create your first Dockerfile, build a Docker image, and run a container. A Dockerfile is a text document that contains all the commands necessary to build a Docker image, simplifying the containerization process.

---
**Prerequisites**

    Basic knowledge of Docker and Linux commands.
    Access to an Ubuntu system or EC2 instance.

**Steps**

1. Launch an EC2 Instance

       Create and launch an EC2 instance running Ubuntu.
   
2. SSH into the Instance

        Connect to the EC2 instance via SSH:



        ssh -i "your-key.pem" ubuntu@<ec2-public-ip>

3. Create a Dockerfile and Build the Image

Inside the SSH session, create a Dockerfile. Then, build the Docker image using the following command:

    docker build -t first_docker .
---
**What is a Dockerfile?**<br>

A Dockerfile is a text file containing instructions to build a Docker image. It defines the base image, commands to execute, and files to include. This helps create consistent environments and simplifies application deployment.

---

4. Verify and Run the Container

Once the image is built, run the container using:

    docker run -d -p 80:80 <image_id>

You can check the container status with:

    docker ps

5. Access the Application

        Visit the public IP of your EC2 instance in a web browser to view the application.

   ---
**Conclusion**

By following this guide, you've successfully created and run a Docker container using a Dockerfile. This task demonstrates how to use Dockerfiles for creating images, which streamlines the process of deploying containerized applications.
