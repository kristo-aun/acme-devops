#!/usr/bin/env bash

scriptpath=$(dirname $(readlink -f $0))
dir=$(readlink -f $scriptpath/../../..)

export ACME_NAMESPACE=${1:-"acme-namespace"}

source $dir/acmekube/env/env-main.sh

bash $scriptpath/_ns-delete.sh
