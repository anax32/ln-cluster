#!/bin/bash

##
#
# run an lnd node with local config mounted into the container
#
##

docker run \
  -it \
  --rm \
  -v $(pwd)/config:/config \
  -v $(pwd)/data:/data \
  -p 8080:8080 \
  --name lnd-node \
  lightninglabs/lnd:v0.12.0-beta \
    --lnddir=/data \
    -C=/config/node-a.conf
