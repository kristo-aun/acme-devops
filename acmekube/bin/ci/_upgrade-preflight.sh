#!/usr/bin/env bash

echo "Helm upgrade preflight...Start"

scriptpath=$(dirname $(readlink -f $0))
dir=$(readlink -f $scriptpath/../../..)

echo ""
env | grep LUM_K8S_
#env | grep LUM_TMP_
env | grep LUM_FORGEOPS_AM_
env | grep LUM_FORGEOPS_RELEASE
env | grep LUM_FORGEOPS_INIT_GIT_BRANCH




echo ""

helm init --upgrade

echo "Helm upgrade preflight...Done"
