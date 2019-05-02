#!/usr/bin/env bash

SCRIPTLINK=$(readlink -f "$0")
BASEDIR=$(dirname "$SCRIPTLINK")

echo "Helm chart dir=$BASEDIR"

function environment {
    bash $BASEDIR/../create_helm_override_yaml.sh \
        $BASEDIR/values-template.yaml \
        $BASEDIR/values.yaml
}

environment

exit 0
