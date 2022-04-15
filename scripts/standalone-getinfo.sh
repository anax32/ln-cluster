#!/bin/bash

MACAROON=$1
ENDPOINT=$2

echo $MACAROON
echo $ENDPOINT

curl -k -H "Grpc-Metadata-macaroon: ${MACAROON}" ${ENDPOINT}/v1/getinfo
