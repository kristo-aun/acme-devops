#!/usr/bin/env bash

scriptpath=$(dirname $(readlink -f $0))
dir=$(readlink -f $scriptpath/../../..)
echo "dir=$dir"


bash $dir/bin/debug-logs.sh kube-system
