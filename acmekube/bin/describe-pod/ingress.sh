#!/usr/bin/env bash

pod=$(kubectl get pods --all-namespaces -o="name" | grep ingress-controller | cut -d "/" -f2)
echo "Pod: $pod"

kubectl describe pods $pod --namespace kube-system
