#!/bin/bash

if [ $# -eq 0 ]
	then
		echo "Missing env.  Options: dev or test"
		exit 1
fi

ns=5115cc-$1

oc -n $ns import-image nginx:alpine --from=docker.io/nginx:alpine --confirm
oc -n $ns import-image mariadb:latest --from=docker.io/mariadb:latest --confirm
oc -n $ns import-image nextcloud:20 --from=docker.io/nextcloud:20 --confirm
