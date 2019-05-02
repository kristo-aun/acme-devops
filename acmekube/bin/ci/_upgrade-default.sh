#!/usr/bin/env bash

echo "CI Helm chart upgrade...Start"

cmd="helm upgrade $LUM_FORGEOPS_RELEASE $LUM_FORGEOPS_HELM_CHART_HOME \
    --wait --timeout 400 \
    --tiller-namespace=kube-system \
    --namespace=$ACME_NAMESPACE \
    --install \
    --kube-context $LUM_K8S_CONTEXT \
    --force --recreate-pods"

question="$cmd"
if [[ $LUM_FORGEKUBE_INTERACTIVE -ne 1 ]] || whiptail --yesno "$question" 20 60 ;then
    ${cmd}
else
    echo "whiptail cmd execution condition missing"
fi

echo "CI Helm chart upgrade...Done"
