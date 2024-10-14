# 3-Tier Architecture: Dockerize Angular-Frontend and Java-Backend Application with RDS Integration

**Task Overview**

In this task, we will set up a 3-tier architecture by Dockerizing an Angular frontend and a Java backend, and integrating it with an Amazon RDS database. We will create Docker images for both the frontend and backend, configure the RDS connection, and deploy them on an EC2 instance.

---
**Prerequisites**

    AWS EC2 instance with Docker installed
    Amazon RDS MySQL database set up
    Git installed
    Docker installed on the EC2 instance

**Steps**

Step 1: Launch EC2 Instance and Install Docker

    Create an EC2 instance using a custom user data script to install Docker.
    SSH into the instance.

Step 2: Clone the Repository

Clone the repository containing the application code:

    git clone https://github.com/rajatpzade/anguler-java.git

Step 3: Install MariaDB

Update the operating system and install MariaDB server:

    sudo apt-get update
    sudo apt-get install mariadb-server

Step 4: Set Up Amazon RDS Database

  Create an Amazon RDS database with a username (admin) and password.
  Connect to the RDS database using:

    mysql -h <rds-endpoint> -u admin -p

  Import the springbackend.sql file into the database:

    source /path/to/springbackend.sql

Step 5: Configure and Dockerize the Backend (Spring Boot)

    Navigate to the spring-backend folder.
    Modify application.properties to include your RDS endpoint, username, and password.
    Create a Dockerfile for the backend service:

**Dockerfile**

# Dockerfile content

  Build the Docker image:

    docker build -t angular:backend .

Step 6: Configure and Dockerize the Frontend (Angular)

  Navigate to the angular-frontend folder.
  Modify the public IP in the worker.service.ts file to match your instance's public IP.
  Create a Dockerfile for the frontend service.
  Build the Docker image:

    docker build -t angular:frontend .

Step 7: Run the Docker Containers

  Run both the backend and frontend Docker containers:

    sudo docker run -d -p 8080:8080 angular:backend
    sudo docker run -d -p 80:80 angular:frontend

  Verify the containers are running:

    docker ps

Step 8: Access the Application

    Paste the public IP of your EC2 instance into your web browser to access the application.

---
**Conclusion**

By following this process, you have successfully set up a 3-tier architecture using Docker containers for the Angular frontend and Java backend, and connected the backend to an Amazon RDS database. You can now access your full application through the public IP of the EC2 instance.
