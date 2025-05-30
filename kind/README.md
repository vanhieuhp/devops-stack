## Deploy metalb

1. 
curl https://raw.githubusercontent.com/metallb/metallb/v0.14.9/config/manifests/metallb-native.yaml > metallb-native.yaml

2. 
helm repo add metallb https://metallb.github.io/metallb
helm install metallb metallb/metallb