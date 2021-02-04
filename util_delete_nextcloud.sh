#!/bin/bash

if [ $# -eq 0 ]
	then
		echo "Missing env.  Options: dev or test"
		exit 1
fi

env=$1
ns=5115cc-$env

oc -n $ns delete dc/nextcloud
oc -n $ns delete bc/nginx
oc -n $ns delete cj/nextcloud-cron
oc -n $ns delete route/nextcloud
oc -n $ns delete pvc/nextcloud-files
oc -n $ns delete svc/nextcloud

oc -n $ns delete dc/nextcloud-postgresql
oc -n $ns delete svc/nextcloud-postgresql
oc -n $ns delete pvc/nextcloud-postgresql
oc -n $ns delete secret/nextcloud-postgresql