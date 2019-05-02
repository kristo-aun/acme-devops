#!/usr/bin/env bash

pod=$(kubectl get pods --all-namespaces -o="name" | grep postgresql | cut -d "/" -f2)
echo "Pod: $pod"

kubectl --namespace acme-namespace logs $pod -c acme-postgresql -f
