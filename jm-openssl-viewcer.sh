#!/bin/sh

# $1 = cer file
openssl x509 -in $1 -noout -text
