#!/usr/bin/env bash

echo "CI...Start"

scriptpath=$(dirname $(readlink -f $0))
dir=$(readlink -f $scriptpath/../../..)
echo "CI: dir=$dir"

export LUM_FORGEOPS_RELEASE="acme"

source $dir/acmekube/env/env-main.sh
source $dir/acmekube/env/k8s/_context.sh

export LUM_FORGEOPS_HELM_CHART_HOME="$LUM_FORGEOPS_HELM/$LUM_FORGEOPS_RELEASE"

echo "CI...Prepare charts"
bash $LUM_FORGEOPS_HELM_CHART_HOME/prepare-charts.sh
bash $scriptpath/_upgrade-preflight.sh
bash $scriptpath/_upgrade-default.sh

echo "CI...Done"

#bash $scriptpath/_post-deploy.sh
