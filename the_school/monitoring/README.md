## Install prometheus-stack with helm
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm install prometheus prometheus-community/kube-prometheus-stack --namespace monitoring --set prometheus.prometheusSpec.storageSpec.volumeClaimTemplate.spec.storageClassName=nfs-storage --set prometheus.prometheusSpec.storageSpec.volumeClaimTemplate.spec.accessModes[0]=ReadWriteMany --set prometheus.prometheusSpec.storageSpec.volumeClaimTemplate.spec.resources.requests.storage=10Gi
--set prometheus.prometheusSpec.maximumStartupDurationSeconds=300

helm install monitoring prometheus-community/kube-prometheus-stack --namespace monitoring \
--set prometheus.prometheusSpec.storageSpec.volumeClaimTemplate.spec.storageClassName=nfs-storage \
--set prometheus.prometheusSpec.storageSpec.volumeClaimTemplate.spec.accessModes[0]=ReadWriteMany \
--set prometheus.prometheusSpec.storageSpec.volumeClaimTemplate.spec.resources.requests.storage=10Gi \
--set prometheus.prometheusSpec.maximumStartupDurationSeconds=300

helm upgrade monitoring kube-prometheus-stack --values values.yaml --namespace monitoring

## Install grafana with helm
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
helm install grafana grafana/grafana --namespace monitoring --set grafana.ingress.enabled=true --set grafana.ingress.hosts[0]=grafana.dev10.com