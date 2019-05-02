#!/usr/bin/env bash

# kubectl --namespace acme-namespace get services -o wide

kubectl --namespace kube-system get services -o wide
