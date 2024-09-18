# Student Application Containerization
---
**Overview**

This guide helps you containerize a simple student application by creating Docker images for its frontend, backend, and database components. Containerization ensures consistent environments, enhancing scalability and manageability across different stages of the software lifecycle.
**Prerequisites**

    Basic knowledge of Docker.
    Access to an Ubuntu EC2 instance or any Ubuntu machine.

**Steps**
1. Launch an EC2 Instance

        Create and launch an EC2 instance on AWS.
2. SSH into the Instance

        Connect to the EC2 instance via SSH:

        ssh -i "your-key.pem" ubuntu@<ec2-public-ip>

3. Create Application Directories

        Create three directories: FE, BE, and DB:
        
        mkdir FE BE DB

4. Database (DB) Setup

        Go to the DB directory and create a Dockerfile and init-db.sql file. Then, build the database image:
               
        docker build -t db_image .
        Run the container using the created image.
5. Backend (BE) Setup

        In the BE directory, create a Dockerfile and context.xml. Build the backend image:
        
        docker build -t backend_image .
    
        Run the backend container.
6. Frontend (FE) Setup

        In the FE directory, create a Dockerfile and index.html. Build the frontend image:
        
        docker build -t frontend_image .
    
        Run the frontend container.
7. Verify Running Containers

        Check the status of all containers using:
        
        docker ps
---
**Conclusion**

You've successfully containerized a student application with separate components for the database, backend, and frontend. This task enhances the app's reliability, scalability, and ease of management by encapsulating its dependencies in Docker containers.
