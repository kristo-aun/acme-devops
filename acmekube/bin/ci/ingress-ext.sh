#!/usr/bin/env bash

echo "CI...Start"

scriptpath=$(dirname $(readlink -f $0))
dir=$(readlink -f $scriptpath/../../..)
echo "CI: dir=$dir"

source $dir/acmekube/env/env-main.sh
source $dir/acmekube/env/k8s/_context.sh

kcontext=`kubectl config current-context`
ancontext=${kcontext//[^[:alnum:]]/}
export LUM_FORGEOPS_RELEASE="ingress-ext-release"
export LUM_FORGEOPS_HELM_CHART_HOME="$LUM_FORGEOPS_HELM/ingress"

fileExt="$LUM_FORGEOPS_HELM_CHART_HOME/$ancontext-ext.yaml"

if [ -f "$fileExt" ]
then
	export LUM_FORGEOPS_HELM_CHART_YAML="$fileExt"
else
	export LUM_FORGEOPS_HELM_CHART_YAML="$LUM_FORGEOPS_HELM_CHART_HOME/$ancontext.yaml"
fi

echo "CI...Prepare charts"
bash $scriptpath/_upgrade-preflight.sh
bash $scriptpath/_ingress-upgrade.sh

echo "CI...Done"

cd
