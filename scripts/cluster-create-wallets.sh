#!/bin/bash

NAME_PREFIX=$1
NUM_NODES=${2:-1}

for num in $(seq 1 $NUM_NODES)
do
  name=$NAME_PREFIX$num
  echo $name

  docker exec -it $name /bin/bash -c "lncli --lnddir=/data create"
#  curl -k -H "Grpc-Metadata-macaroon: ${MACAROON}" ${endpoint}:${port}/v1/getinfo
done
