# Kubernetes Deployment Using Pre-built Docker Images for Student Application


**Overview**

This guide helps you deploy a student application on Kubernetes using pre-built Docker images for its database, backend, and frontend components. Kubernetes enables efficient scaling and management of containerized applications across various environments.
<br>

---
**Prerequisites**

    Minikube, EKS Cluster, or Kubeadm installed on your local system.
    This guide focuses on deployment with Minikube, but steps for EKS or Kubeadm may differ.

**Steps**
1. Start Minikube

Start Minikube with Docker as the driver:

    minikube start --driver=docker

Set an alias for Minikube:

    alias kubectl="minikube kubectl --"

2. Clone the Repository

Clone the repository containing context.xml and index.html. If the repository is private, you can manually create these files:

    context.xml: Configuration file for the backend application.
    index.html: Frontend HTML file.

3. Deploy the Database Pod

Create and expose the database pod using the pre-built Docker image:

    kubectl create deployment db --image=gaurav1251/studentapp_db:Database --port=3306
    kubectl expose deployment db --name=db --target-port=3306 --type=ClusterIP

4. Deploy the Backend Pod

Deploy the backend using the pre-built Docker image and expose the service:

    kubectl create deployment be --image=gaurav1251/studentapp_be:Backend --port=8080
    kubectl expose deployment be --name=be --target-port=8080 --type=NodePort

5. Deploy the Frontend Pod

Create and expose the frontend pod:

    kubectl create deployment fe --image=gaurav1251/studentapp_fe:Frontend --port=80
    kubectl expose deployment fe --name=fe --target-port=80 --type=NodePort

6. Update Configuration Files

        context.xml: Replace the database IP with the database service name.
        index.html: Update the backend IP and port.

7. Copy Configuration Files to Pods

Copy the updated context.xml and index.html to the backend and frontend pods:

    kubectl cp /path/to/context.xml backend-pod:/path/to/context.xml
    kubectl cp /path/to/index.html frontend-pod:/path/to/index.html

8. Verify Pods and Services

Ensure all the pods and services are running correctly:

    kubectl get pods
    kubectl get services

9. Access the Application
Allow the ports assigned by NodePort :

       ufw allow port
To access the student application, run:


    minikube service fe

---

**Click on the "Enter to Student Application" button on the frontend interface to interact with the application.**

<br>
<br>

**Conclusion**

You've successfully deployed a student application on Kubernetes using pre-built Docker images for its database, backend, and frontend. Kubernetes helps ensure efficient scaling, reliability, and management of the application across different environments.
