#!/bin/bash

##
#
# create an lnd conf file using environment variables and envsubst
#
#

export HOST_IP=$(hostname -i)

echo $HOST_IP

envsubst < $1 > $2
