#!/usr/bin/env bash

pod=$(kubectl get pods --all-namespaces -o="name" | grep --invert-match postgres  | grep acme | cut -d "/" -f2)

echo "Pod: $pod"

kubectl --namespace acme-namespace logs $pod -c acme-app -f
