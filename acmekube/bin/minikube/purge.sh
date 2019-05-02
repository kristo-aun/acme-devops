#!/usr/bin/env bash

#set -e
#set -v

# minikube config set WantReportErrorPrompt false
minikube stop
minikube delete

rm -Rf ~/.minikube
#rm -Rf ~/.kube
rm -Rf ~/.helm

echo "Minikube: purged"

exit 0
