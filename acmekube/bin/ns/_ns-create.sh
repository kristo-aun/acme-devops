#!/usr/bin/env bash

echo "NS config...Start"

echo ""
env | grep LUM_

_nspace=`kubectl config view -o jsonpath="{.contexts[?(@.name==\"$kcontext\")].context.namespace}"`
nspace="${ACME_NAMESPACE:-$_nspace}"

if $(kubectl get namespace ${nspace} > /dev/null 2>&1); then
    echo "=> Namespace ${nspace} already exists.  Skipping creation..."
else
    echo "=> Creating namespace \"${nspace}\""
    kubectl create namespace ${nspace}
fi

kubens $nspace

if [ $? -ne 0 ]; then
    echo "Non-zero return by kubens.  Is your namespace correct? Exiting!"
    exit 1
fi

echo ""
git clone $LUM_SECURITY_RESOURCES_GIT_REPO $LUM_SECURITY_RESOURCES_GIT_HOME --branch $LUM_SECURITY_RESOURCES_GIT_BRANCH

echo ""
kubectl create secret generic git-ssh-key --from-file=$LUM_DEVOPS_SSH/id_rsa

###

if [ ! -z "$LUM_K8S_ACME_FQDN" ]
then
    echo "Found fqdn for ACME: $LUM_K8S_ACME_FQDN"
    kubectl create secret tls $LUM_K8S_ACME_FQDN --cert $LUM_TLS_SELF_SIGNED_WEB_CER --key $LUM_TLS_SELF_SIGNED_WEB_KEY
    kubectl label secret $LUM_K8S_ACME_FQDN strategy=SelfSigned
else
    echo "FQDN for ACME not found!"
fi

# strategy=UserProvided

echo "NS config...Done"
