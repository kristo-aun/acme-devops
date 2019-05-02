#!/usr/bin/env bash

envScriptpath=$(dirname $(readlink -f ${BASH_SOURCE[0]}))
forgeopsDir=$(readlink -f $envScriptpath/../..)
NOW=$(date +"%Y-%m-%dT%H-%M-%S.%3N")

export LUM_TMP_WORKSPACE="/tmp/acmegit##$NOW"
export LUM_SECURITY_RESOURCES_GIT_REPO="https://github.com/studiofrancium/franciumca.git"
export LUM_SECURITY_RESOURCES_GIT_HOME="$LUM_TMP_WORKSPACE/security-resources"
export LUM_SECURITY_RESOURCES_GIT_BRANCH="master"
export LUM_DEVOPS_SSH="$LUM_SECURITY_RESOURCES_GIT_HOME/ssh_devops"
export LUM_DEVELOPMENT_CA="$LUM_TMP_WORKSPACE/security-resources/tls/keystore"
export LUM_TLS_SELF_SIGNED_WEB_CER="$LUM_DEVELOPMENT_CA/acme.cer"
export LUM_TLS_SELF_SIGNED_WEB_KEY="$LUM_DEVELOPMENT_CA/acme.key"

export LUM_FORGEOPS_HELM="$forgeopsDir/helm"

export LUM_FORGEKUBE_INTERACTIVE=${LUM_FORGEKUBE_INTERACTIVE-1}

# mkdir -p $LUM_TMP_WORKSPACE

echo "Set main env...Done"
