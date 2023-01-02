#!/usr/bin/env bash
set -e

echo "Getting frontend service address"
NAMESPACE=$1

until [ ! -z $frontend ]; do
  sleep 1
  export frontend=$(kubectl get service web -n $NAMESPACE -o jsonpath='{.status.loadBalancer.ingress[0].hostname}')
done

echo $frontend
