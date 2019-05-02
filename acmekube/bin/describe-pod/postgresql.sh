#!/usr/bin/env bash

pod=$(kubectl get pods --all-namespaces -o="name" | grep postgresql | cut -d "/" -f2)
echo "Pod: $pod"

kubectl describe --namespace acme-namespace pods $pod
