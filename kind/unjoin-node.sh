
#
kubectl drain worker2 --ignore-daemonsets --delete-emptydir-data
kubectl drain worker2 --force --ignore-daemonsets --delete-emptydir-data
kubectl delete node worker2

sudo kubeadm reset -f