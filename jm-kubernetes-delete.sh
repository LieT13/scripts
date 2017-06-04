#!/bin/sh

# $1 ingress name
# $2 service name
# $3 deployment name
kubectl delete ingress $1
kubectl delete service $2
kubectl delete deployment $3
