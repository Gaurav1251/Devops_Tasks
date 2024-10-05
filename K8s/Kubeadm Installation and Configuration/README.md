# Kubeadm Installation and Configuration

![Screenshot from 2024-10-04 13-28-20](https://github.com/user-attachments/assets/ae53a648-a2fe-44f2-b641-04d891bc7e80)


**Overview**

Kubeadm is a tool designed to simplify the process of setting up and managing Kubernetes clusters. It enables users to bootstrap a Kubernetes control plane, add worker nodes, and manage cluster configurations effectively.

---
**Prerequisites**

    Basic knowledge of Linux and SSH.
    Ubuntu-based EC2 instances for both master and worker nodes.

---
**Steps to Install and Configure Kubeadm**
1. Create and Launch the Master Node

       Launch an EC2 instance and SSH into it.

2. Rename the Hostname to Master

        sudo -i
        hostnamectl set-hostname master

3. Update the Master Node

        sudo apt-get update
---
4. Install Docker on the Master Node

        Create a docker.sh file with the Docker installation commands.
        chmod +x docker.sh  
        ./docker.sh

5. Install Kubeadm, Kubelet, and Kubectl

        sudo apt-get install -y apt-transport-https ca-certificates curl
        curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.30/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
        echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.30/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
        sudo apt-get update
        sudo apt-get install -y kubelet kubeadm kubectl

6. Configure Security Group for the Master Node

        Open the following ports:
            6443: Kubernetes API server communication.
            10250: Kubelet communication.
            10255: Kubelet read-only access (optional).
---
7. Initialize the Kubernetes Cluster

        sudo kubeadm init --pod-network-cidr=192.168.0.0/16

8. Set Up the Cluster Configuration

        mkdir -p $HOME/.kube
        sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
        sudo chown $(id -u):$(id -g) $HOME/.kube/config

9. Install Calico Networking

        kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml
---
**Adding Worker Nodes** <br>
10. Create and Launch Worker Node

    SSH into the worker node and rename its hostname:
    
    sudo -i
    hostnamectl set-hostname worker

11. Install Docker on the Worker Node

        sudo apt-get update
        sudo apt-get install docker.io -y

13. Install Kubeadm, Kubelet, and Kubectl on Worker Node

        sudo apt-get install -y apt-transport-https ca-certificates curl
        curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.30/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
        echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.30/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
        sudo apt-get update
        sudo apt-get install -y kubelet kubeadm kubectl

14. Join the Worker Node to the Cluster

        On the master node, generate a join token:

            kubeadm token create --print-join-command

        Run the join command on the worker node:

            sudo kubeadm join <master-ip>:6443 --token <token> --discovery-token-ca-cert-hash <hash>

14. Verify Node Join Status

    Run the following on the master node:

        kubectl get nodes

---

**Deploying a Test Application** <br>
15. Deploy Nginx on the Cluster
    
    kubectl create deployment nginx --image=nginx
    kubectl expose deployment nginx --port=80 --type=NodePort

16. Configure Security Group for Nginx

        Open the assigned NodePort (e.g., 30507) in the EC2 security group.

17. Access Nginx

        Open the worker node IP and the assigned port in a browser:

        http://<worker-node-ip>:<nodeport>

---

**Conclusion**

In this guide, you set up a Kubernetes cluster using Kubeadm, initialized the master node, and added a worker node. You also deployed an Nginx application to test the cluster's functionality. This foundational setup allows you to manage containerized applications at scale.
