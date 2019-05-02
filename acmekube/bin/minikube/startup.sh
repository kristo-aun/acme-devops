#!/usr/bin/env bash

# set -v

echo "Minikube...Startup"

scriptpath=$(dirname $(readlink -f $0))
dir=$(readlink -f $scriptpath/../../..)

function quit {
    echo "Exit with error: $1 $2 $3"
    exit 1
}

function checkMinikube {
    out=$(minikube status 2>&1)
    if [ $? -ne 0 ]; then
        quit "Stop minikube before proceeding!" $?
    fi
}

function waitMinikube {
    set -e
    minikube config set WantUpdateNotification false
    minikube start --cpus=2 --memory=8192 --disk-size=14g --vm-driver=virtualbox --bootstrapper=kubeadm --v=2

    for i in {1..150}; do # timeout for 5 minutes
        kubectl get po &> /dev/null
        if [ $? -ne 1 ]; then
            break
        fi
        sleep 2
    done
}

function configureMinikube {
    minikube ssh sudo ip link set docker0 promisc on
    minikube addons enable ingress
}


function startup {

    # Pre-requisites for Helm chart installation
    ## Start minikube
    waitMinikube
    configureMinikube

    ## Switch to minikube context
    kubectx minikube

    bash $dir/acmekube/bin/ns/ns-create.sh
    helm init --upgrade
}


# Pre-flight checks
## Check minikube status
# checkMinikube
## Print environment
# env | grep LUM_

startup

echo "Minikube startup...Done"

exit 0
