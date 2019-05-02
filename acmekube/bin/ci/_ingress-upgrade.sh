#!/usr/bin/env bash

echo "CI Ingress chart upgrade...Start"

cmd="helm upgrade $LUM_FORGEOPS_RELEASE stable/nginx-ingress \
    --wait --timeout 400 \
    --tiller-namespace=kube-system \
    --namespace=kube-system \
    --install -f $LUM_FORGEOPS_HELM_CHART_YAML \
    --kube-context $LUM_K8S_CONTEXT \
    --force --recreate-pods"

question="$cmd"
if [[ $LUM_FORGEKUBE_INTERACTIVE -ne 1 ]] || whiptail --yesno "$question" 20 60 ;then
    ${cmd}
else
    echo "whiptail cmd execution condition missing"
fi

echo "CI Ingress chart upgrade...Done"
