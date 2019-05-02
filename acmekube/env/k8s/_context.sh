#!/usr/bin/env bash

k8sScriptpath=$(dirname $(readlink -f ${BASH_SOURCE[0]}))
k8sScriptDir=$(readlink -f $k8sScriptpath)
kcontext=`kubectl config current-context`

_nspace=`kubectl config view -o jsonpath="{.contexts[?(@.name==\"$kcontext\")].context.namespace}"`
nspace=${ACME_NAMESPACE:-$_nspace}

ancontext=${kcontext//[^[:alnum:]]/}

echo "Alphanumeric kontext name: $ancontext"

k8sScript="$k8sScriptDir/$ancontext.sh"

echo "k8sScript: $k8sScript"

export ACME_NAMESPACE="$nspace"

source $k8sScript
