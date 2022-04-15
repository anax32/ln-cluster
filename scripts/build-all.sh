#!/bin/bash

##
#
# build simple lnd wrapper so we can use envars
#
##

docker build \
  -t anax32/lnd:latest \
  -t anax32/lnd:v0.12.0-beta \
  --build-arg LND_VERSION=v0.12.0-beta \
  .
