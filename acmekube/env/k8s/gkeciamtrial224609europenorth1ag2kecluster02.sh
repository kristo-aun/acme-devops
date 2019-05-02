#!/usr/bin/env bash

envScriptpath=$(dirname $(readlink -f ${BASH_SOURCE[0]}))
forgeopsDir=$(readlink -f $envScriptpath/../../..)

kcontext="gke_ciamtrial-224609_europe-north1-a_g2ke-cluster-02"
ancontext=${kcontext//[^[:alnum:]]/}

export LUM_K8S_CONTEXT="$kcontext"
export LUM_K8S_DOMAIN="example.com"

export LUM_K8S_ACME_SUBDOMAIN="g2ke-acme"
export LUM_K8S_ACME_DOMAIN="$LUM_K8S_DOMAIN"
export LUM_K8S_ACME_FQDN="$LUM_K8S_ACME_SUBDOMAIN.$LUM_K8S_ACME_DOMAIN"
export LUM_K8S_ACME_INSTANCE="https://$LUM_K8S_ACME_FQDN"

echo "K8S env...Done"
