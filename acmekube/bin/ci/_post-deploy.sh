#!/usr/bin/env bash

removetmp() {
    tmpCharts="$LUM_FORGEOPS_HELM_CHART_HOME/charts"
    rm -Rf $tmpCharts
    #rm -Rf $LUM_FORGEOPS_HELM_CHART_HOME/values.yaml
    rm -Rf $LUM_TMP_WORKSPACE
}

removetmp

echo "Cleaning up temporary files...Done"
