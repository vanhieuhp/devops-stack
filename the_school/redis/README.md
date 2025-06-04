## 1. install redis with helm
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
helm install redis-sentinel bitnami/redis --namespace architecture --values values.yaml

## 2. Install nginx with helm
kubectl apply -f nginx-pod.yaml

## 3. Check the status of the redis-sentinel
1. execute into the nginx-pod
2. redis-cli -h redis-sentinel.architecture.svc.cluster.local -p 26379 -a the-school
3. SENTINEL get-master-addr-by-name mymaster

## 4. Access to redis server
1. redis-cli -h redis-sentinel-node-0.redis-sentinel-headless.architecture.svc.cluster.local -p 6379 -a the-school