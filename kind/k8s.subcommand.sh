#! /bin/bash

kubectl create secret generic ecr-registry-secret --from-file=.dockerconfigjson=config.json  --type=kubernetes.io/dockerconfigjson  --namespace ecommerce