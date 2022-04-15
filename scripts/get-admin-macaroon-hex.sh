#!/bin/bash

##
#
# get the admin macaroon
#
##

docker exec \
  -it \
  $1 \
  bash -c 'xxd -p data/data/chain/bitcoin/regtest/admin.macaroon | tr -cd "[:alnum:]."'
