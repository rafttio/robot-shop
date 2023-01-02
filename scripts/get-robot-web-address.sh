#!/usr/bin/env bash
set -e

echo "Getting frontend service address"
NAMESPACE=$1

until [ ! -z $frontend ] && [[ $frontend != \<* ]]; do
  sleep 1
  export frontend=$(kubectl get service web -n $NAMESPACE --no-headers | awk '{print $4}')
done

echo $frontend
