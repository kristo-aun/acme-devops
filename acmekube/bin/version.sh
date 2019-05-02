#!/usr/bin/env bash

# env | grep LUM_

echo ""
echo "kubeadm"
kubeadm version

echo ""
echo "kubelet"
kubelet --version

echo ""
echo "kubectl"
kubectl version

echo ""
echo "minikube"
minikube version

echo ""
echo "helm"
helm version

echo ""
echo "git"
git --version

echo ""
echo "npm"
npm --version

echo ""
echo "node"
node --version

echo ""
echo "yarn"
yarn --version

echo ""
echo "docker"
docker --version
