#!/bin/bash

# Update and upgrade the system packages
sudo apt update -y && sudo apt upgrade -y

# Create a new user 'devops' and add it to sudo group
sudo adduser devops
sudo usermod -aG sudo devops
su devops
cd /home/devops

# Disable swap (Kubernetes requirement)
sudo swapoff -a
sudo sed -i '/swap.img/s/^/#/' /etc/fstab

# Load required kernel modules for containerd
echo "overlay" | sudo tee -a /etc/modules-load.d/containerd.conf
echo "br_netfilter" | sudo tee -a /etc/modules-load.d/containerd.conf
sudo modprobe overlay
sudo modprobe br_netfilter

# Configure kernel parameters for Kubernetes networking
echo "net.bridge.bridge-nf-call-ip6tables = 1" | sudo tee -a /etc/sysctl.d/kubernetes.conf
echo "net.bridge.bridge-nf-call-iptables = 1" | sudo tee -a /etc/sysctl.d/kubernetes.conf
echo "net.ipv4.ip_forward = 1" | sudo tee -a /etc/sysctl.d/kubernetes.conf
sudo sysctl --system

# Install prerequisites for Docker repository
sudo apt install -y curl gnupg2 software-properties-common apt-transport-https ca-certificates

# Add Docker's official GPG key and repository
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/docker.gpg
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Install containerd container runtime
sudo apt update -y
sudo apt install -y containerd.io

# Configure containerd and enable SystemdCgroup
containerd config default | sudo tee /etc/containerd/config.toml >/dev/null 2>&1
sudo sed -i 's/SystemdCgroup = false/SystemdCgroup = true/g' /etc/containerd/config.toml

# Start and enable containerd service
sudo systemctl restart containerd
sudo systemctl enable containerd

# Add Kubernetes repository and GPG key
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.32/deb/ /" | sudo tee /etc/apt/sources.list.d/kubernetes.list
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.32/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

# Install Kubernetes components (kubelet, kubeadm, kubectl)
sudo apt update -y
sudo apt install -y kubelet kubeadm kubectl
# Prevent automatic updates to Kubernetes components
sudo apt-mark hold kubelet kubeadm kubectl
sudo apt-mark unhold kubelet kubeadm kubectl

sudo apt install -y kubelet=1.32.0-1.1 kubeadm=1.32.0-1.1 kubectl=1.32.0-1.1