#!/usr/bin/env bash

envScriptpath=$(dirname $(readlink -f ${BASH_SOURCE[0]}))
forgeopsDir=$(readlink -f $envScriptpath/../../..)

kcontext="minikube"
ancontext=${kcontext//[^[:alnum:]]/}

export LUM_K8S_CONTEXT="$kcontext"
export LUM_K8S_DOMAIN="example.com"

export LUM_K8S_ACME_SUBDOMAIN="m1kube-acme"
export LUM_K8S_ACME_DOMAIN="$LUM_K8S_DOMAIN"
export LUM_K8S_ACME_FQDN="$LUM_K8S_ACME_SUBDOMAIN.$LUM_K8S_ACME_DOMAIN"
export LUM_K8S_ACME_INSTANCE="https://$LUM_K8S_ACME_FQDN"

echo "Minikube env...Done"
