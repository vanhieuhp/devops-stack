#!/bin/bash

# Variables
VM_HOST=master                           # Vagrant VM name
REMOTE_CONFIG_PATH=/etc/kubernetes/admin.conf
TEMP_KUBECONFIG=vm-kubeconfig.yaml
MERGED_CONFIG=merged-config.yaml
NEW_CONTEXT_NAME=k8s-on-vm               # You can change this

# Step 1: Export admin.conf from VM to host
echo "[INFO] Copying kubeconfig from VM..."
vagrant ssh "$VM_HOST" -c "sudo cat $REMOTE_CONFIG_PATH" > "$TEMP_KUBECONFIG"

# Step 2: Merge with current ~/.kube/config
echo "[INFO] Merging kubeconfig files..."
KUBECONFIG=~/.kube/config:"$TEMP_KUBECONFIG" kubectl config view --flatten > "$MERGED_CONFIG"

# Step 3: Backup existing config
echo "[INFO] Backing up original kube config..."
cp ~/.kube/config ~/.kube/config.backup

# Step 4: Move merged config to ~/.kube/config
mv "$MERGED_CONFIG" ~/.kube/config
rm "$TEMP_KUBECONFIG"

# Optional: Rename context to something clearer
echo "[INFO] Renaming context..."
kubectl config rename-context kubernetes-admin@kubernetes "$NEW_CONTEXT_NAME"

# Final step: Show current context list
echo "[INFO] Available contexts:"
kubectl config get-contexts

echo "[DONE] Merged kubeconfig and renamed new context to '$NEW_CONTEXT_NAME'"

