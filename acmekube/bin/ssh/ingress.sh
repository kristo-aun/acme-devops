#!/usr/bin/env bash

pod=$(kubectl get pods --all-namespaces -o="name" | grep nginx-ingress-controller | cut -d "/" -f2)

kubectl --namespace kube-system exec -it $pod -- /bin/bash
