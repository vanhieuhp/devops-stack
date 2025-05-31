#!/bin/bash

# Reset any previous Kubernetes configuration
# This removes all kubeadm installed state and configuration
sudo kubeadm reset -f

# Clean up the etcd data directory
# etcd is the distributed key-value store used by Kubernetes
sudo rm -rf /var/lib/etcd

# Remove any existing static pod manifests
sudo rm -rf /etc/kubernetes/manifests/*

# Initialize the Kubernetes control plane
# This sets up the master node with default configurations
sudo kubeadm init

# Set up kubectl configuration for the current user
# Create the kubectl config directory
mkdir -p $HOME/.kube

# Copy the admin kubeconfig file to user's home directory
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config

# Change ownership of the config file to current user
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Deploy Calico network plugin
# This sets up pod networking using Calico CNI (Container Network Interface)
kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.25.0/manifests/calico.yaml