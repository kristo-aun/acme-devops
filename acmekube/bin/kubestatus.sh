#!/usr/bin/env bash

kcontext=`kubectl config current-context`
nspace=`kubectl config view -o jsonpath="{.contexts[?(@.name==\"$kcontext\")].context.namespace}"`

echo "Forgekube status: context=$kcontext, namespace=$nspace"
echo ""

kubectl get pods --all-namespaces
