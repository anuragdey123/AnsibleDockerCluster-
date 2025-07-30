7. Ansible-Driven Configuration Management Inside Kubernetes Pods 
Note: Manual setup of Ansible inside Pods only 
● Use Ansible installed in Kubernetes pods to configure and manage application 
containers running alongside within the cluster.
---------------------------------------------------------------------------------------
# 🐧 Ansible Cluster Setup using Docker Containers (Manual Installation)

This project demonstrates how to manually create a basic Ansible setup using **Docker containers** (without pre-built images). The Ansible controller connects to a managed node using **SSH with password-based authentication**.

---

## 📁 Project Structure
AnsibleCluster/
├── Dockerfile # For Ansible controller node
├── inventory/hosts # Ansible inventory file

## 🛠️ Technologies Used

- Docker
- Debian Linux
- Ansible
- SSH
- Manual installation (no pre-built images)

---

## 🚀 Steps to Run the Project

### 🔹 1. Create Project Directory

mkdir AnsibleCluster
cd AnsibleCluster

 2. Create Dockerfile (for controller node)
    FROM debian:latest

# Install SSH and other required packages
RUN apt update && \
    apt install -y openssh-server sudo vim python3-pip && \
    apt install -y ansible sshpass && \
    mkdir /var/run/sshd && \
    echo 'root:1234' | chpasswd && \
    sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Expose SSH
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]

3. Build Image and Run Containers
docker build -t ansible-image .
docker run -itd --name controller ansible-image
docker run -itd --name node1 ansible-image

4.Get IP Address of node1
docker inspect -f '{{ .NetworkSettings.IPAddress }}' node1

 5. Access Controller Container
    docker exec -it controller bash
6. Setup Inventory File Inside Controller
   mkdir -p /etc/ansible
echo "node1 ansible_host=<IP_ADDRESS> ansible_user=root ansible_password=1234" > /etc/ansible/hosts
7. Test Connection
  ansible all -m ping


📚 Use Case
This setup helps you:

.Understand manual Ansible installation.

.Learn basic controller-node communication using SSH & passwords.

.Practice infrastructure automation on a local Docker-based environment.



