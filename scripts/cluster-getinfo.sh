#!/bin/bash

NAME_PREFIX=$1
NUM_NODES=${2:-1}

echo $NAME_PREFIX
echo $NUM_NODES

for num in $(seq 1 $NUM_NODES)
do
  name=$NAME_PREFIX$num
  echo $name

  macaroon=$(./scripts/get-admin-macaroon-hex.sh $name)
#  echo ${macaroon}

  endpoint="https://localhost"

  # docker-compose randomises the port/name mappings, so we need to look them up
  host_port=$(docker inspect $name | jq -r '.[0].NetworkSettings.Ports["8080/tcp"][0].HostPort')

  echo ${endpoint}:${port}/v1/getinfo
  curl -k -H "Grpc-Metadata-macaroon: ${macaroon}" ${endpoint}:${host_port}/v1/getinfo
done
