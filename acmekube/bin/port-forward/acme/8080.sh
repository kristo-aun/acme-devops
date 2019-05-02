#!/bin/bash

pod=$(kubectl get pods --all-namespaces -o="name" | grep --invert-match postgres  | grep acme | cut -d "/" -f2)
echo "ACME pod: $pod"

kubectl port-forward \
 -n acme-namespace $pod 8080:8080
