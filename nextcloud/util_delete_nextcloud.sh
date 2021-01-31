env=dev
ns=5115cc-$env

oc -n $ns delete dc/nextcloud
oc -n $ns delete route/nextcloud
oc -n $ns delete pvc/nextcloud-data
oc -n $ns delete svc/nextcloud