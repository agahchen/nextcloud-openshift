#!/bin/bash

if [ $# -eq 0 ]
	then
		echo "Missing env.  Options: dev or test"
		exit 1
fi

env=$1
ns=5115cc-$env

oc -n $ns import-image nginx:alpine --from=docker.io/nginx:alpine --confirm
oc -n $ns import-image mariadb:latest --from=docker.io/mariadb:latest --confirm
oc -n $ns import-image nextcloud:20-fpm --from=docker.io/nextcloud:20-fpm --confirm
oc -n $ns import-image postgres:12 --from=docker.io/postgres:12 --confirm
oc -n 5115cc-dev import-image postgresql-12-rhel7:latest --from=registry.redhat.io/rhscl/postgresql-12-rhel7:latest --confirm
