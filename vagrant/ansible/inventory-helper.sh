#!/bin/bash

source .env
echo "Updating inventory.yml with IPs from .env..."

yq -i -y  --arg master_ip "$K8S_MASTER_IP" '.all.hosts.k8s_master.ansible_host = $master_ip' inventory.yml;
yq -i -y  --arg ssh_user "$SSH_USER" '.all.hosts.k8s_master.ansible_user = $ssh_user' inventory.yml;

yq -i -y  --arg worker1_ip "$WORKER1_IP" '.all.hosts.worker1.ansible_host = $worker1_ip' inventory.yml;
yq -i -y  --arg ssh_user "$SSH_USER" '.all.hosts.worker1.ansible_user = $ssh_user' inventory.yml;

yq -i -y  --arg worker2_ip "$WORKER2_IP" '.all.hosts.worker2.ansible_host = $worker2_ip' inventory.yml;
yq -i -y  --arg ssh_user "$SSH_USER" '.all.hosts.worker2.ansible_user = $ssh_user' inventory.yml;

echo "Inventory updated successfully!"