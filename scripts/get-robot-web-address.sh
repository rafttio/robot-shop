#!/usr/bin/env bash
set -e

echo "Getting frontend ingress address"
NAMESPACE=$1

until [ ! -z $frontend ]; do
  sleep 1
  export frontend=$(kubectl get ingress web -n $NAMESPACE -o jsonpath='{.spec.rules[0].host}')
done

echo $frontend
