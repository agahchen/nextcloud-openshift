#!/bin/bash

if [ $# -eq 0 ]
	then
		echo "Missing env.  Options: dev or test"
		exit 1
fi

env=$1
ns=5115cc-$env

# oc process -f nextcloud.yaml -p NEXTCLOUD_HOST=rsft-dev.apps.silver.devops.gov.bc.ca | oc -n $ns create -f -
# oc process -f nextcloud-2pvcs.yaml -p NEXTCLOUD_HOST=rsft-dev.apps.silver.devops.gov.bc.ca | oc -n $ns create -f -

oc process -f postgresql-persistent.yaml -p NAMESPACE=$ns | oc -n $ns create -f -
oc process -f nextcloud-with-files.yaml -p NEXTCLOUD_HOST=rsft-$env.apps.silver.devops.gov.bc.ca | oc -n $ns create -f -
