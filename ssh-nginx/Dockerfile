# ssh-nginx/Dockerfile
FROM ubuntu:20.04

# Prevent interaction during package install
ENV DEBIAN_FRONTEND=noninteractive

# Install nginx and OpenSSH
RUN apt update && \
    apt install -y nginx openssh-server && \
    mkdir /var/run/sshd && \
    echo 'root:root' | chpasswd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/Port 22/Port 22/' /etc/ssh/sshd_config && \
    echo "export VISIBLE=now" >> /etc/profile

# Start both SSH and Nginx
CMD service ssh start && nginx -g "daemon off;"
