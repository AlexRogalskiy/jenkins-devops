#!/bin/bash

# manual sidecar injection
istioctl kube-inject –kubeconfig "~/.kube/config" \
  -f ./resources/deployment-jenkins-devops.yaml \
  --includeIPRanges=10.0.0.1/24 > \
  deployment-jenkins-devops-istio.yaml \
  && kubectl apply -f deployment-jenkins-devops-istio.yaml -n devops \
  && rm deployment-jenkins-devops-istio.yaml

kubectl apply -f ./resources/service-jenkins-devops.yaml -n devops
