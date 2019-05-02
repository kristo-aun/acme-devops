#!/usr/bin/env bash

pod=$(kubectl get pods --all-namespaces -o="name" | grep --invert-match postgres  | grep acme | cut -d "/" -f2)

kubectl --namespace acme-namespace exec -it $pod -- /bin/bash
