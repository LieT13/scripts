#!/bin/sh

# $1 Registry host:port
# $2 Registry username
# $3 Registry user password
REGISTRY=$1

echo "Log in to registry: ${REGISTRY}"
sudo docker login -u $2 -p $3 ${REGISTRY}

kubectl create -f kubernetes.yml --validate=false
