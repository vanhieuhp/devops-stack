##
1. eksctl utils associate-iam-oidc-provider --cluster eksdemo --region ap-southeast-2 --approve

```
#. Create public node group
eksctl create nodegroup --cluster=eksdemo \
--region=ap-southeast-2 \
--name=eksdemo-ng-public1 \
--node-type=t3.medium \
--nodes=2 \
--nodes-max=4 \
--node-volume-size=20 \
--ssh-access \
--ssh-public-key=kube-demo \
--managed \
--asg-access \
--external-dns-access \
--full-ecr-access \
--appmesh-access \
--alb-ingress-access
```

```
# delete cluster
eksctl delete cluster --name eksdemo --region ap-southeast-2
```