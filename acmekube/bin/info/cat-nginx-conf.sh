#!/usr/bin/env bash

ingresspod=$(kubectl get pods --all-namespaces -o="name" | grep ingress-controller | cut -d "/" -f2)
echo "Pod: $ingresspod"

kubectl exec \
 $ingresspod \
 -n kube-system \
 cat /etc/nginx/nginx.conf
