#!/usr/bin/env bash

pod=$(kubectl get pods --all-namespaces -o="name" | grep --invert-match postgres  | grep acme | cut -d "/" -f2)

kubectl exec $pod -c acme-app -it /bin/bash /usr/local/tomcat/bin/catalina.sh stop

echo "Restarting pod...Done"
