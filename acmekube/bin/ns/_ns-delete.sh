#!/usr/bin/env bash

echo "NS delete...Start"

scriptpath=$(dirname $(readlink -f $0))
dir=$(readlink -f $scriptpath/../../..)
echo "CI: dir=$dir"

_nspace=`kubectl config view -o jsonpath="{.contexts[?(@.name==\"$kcontext\")].context.namespace}"`
nspace="${ACME_NAMESPACE:-$_nspace}"

if $(kubectl get namespace ${nspace} > /dev/null 2>&1); then
    kubens $nspace
    kubectl delete namespace $nspace
else
    echo "=> Namespace ${nspace} does not exist.  Skipping delete..."
fi

echo "NS delete...Done"
