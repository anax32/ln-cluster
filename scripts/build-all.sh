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
  -f Dockerfile.lnd \
  .

docker build \
  -t anax32/cln:latest \
  -t anax32/cln:v0.10.2 \
  --build-arg CLN_VERSION_TAG=v0.10.2 \
  --build-arg BOOST_VERSION=1.74 \
  --build-arg LIBEVENT_VERSION=2.1-7 \
  -f Dockerfile.clightning.b \
  .
