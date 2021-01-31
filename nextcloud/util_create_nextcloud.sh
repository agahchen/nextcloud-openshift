env=dev
ns=5115cc-$env

oc process -f nextcloud.yaml -p NEXTCLOUD_HOST=rsft-$env.apps.silver.devops.gov.bc.ca | oc -n $ns create -f -
