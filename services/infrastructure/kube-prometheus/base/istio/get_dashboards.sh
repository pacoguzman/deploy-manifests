#!/usr/bin/env bash

set -e
set -x
# only exit with zero if all commands of the pipeline exit successfully
set -o pipefail

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# The version of Istio to deploy
VERSION=1.11.3
# Import all Istio dashboards
for DASHBOARD in 7639 11829 7636 7630 7645; do
    REVISION="$(curl -s https://grafana.com/api/dashboards/${DASHBOARD}/revisions -s | jq ".items[] | select(.description | contains(\"${VERSION}\")) | .revision")"
    curl -s https://grafana.com/api/dashboards/${DASHBOARD}/revisions/${REVISION}/download > "${SCRIPT_DIR}/${DASHBOARD}.json"
    echo "Storing $(jq -r '.title' ${SCRIPT_DIR}/${DASHBOARD}.json) (revision ${REVISION}, id ${DASHBOARD})..."
    echo -e "\nDone\n"
done
