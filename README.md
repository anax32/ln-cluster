# lightning network

run a few lightning nodes on a local bitcoin regtest network
with settings controlled by environment variables.

# usage

## build

`LND_VERSION` build arg is the version of the `lnd` container to use as the base image.

```bash
docker build \
  -t anax32/lnd:latest \
  -t anax32/lnd:v0.12.0-beta \
  --build-arg LND_VERSION=v0.12.0-beta \
  .
```

## run

given a running bitcoin node, connect the lnd container to the node
with environment variables via:

```bash
docker run \
  -d \
  --rm \
  -p 8080:8080 \
  --name lnd-node \
  -e BITCOIN_RPC_HOST=btc-node \
  -e BITCOIN_RPC_USER=me \
  -e BITCOIN_RPC_PASS=mypassword1 \
  -e BITCOIN_ZMQ_IP=127.0.0.1 \
  -e BITCOIN_ZMQ_PUBRAWTX_PORT=28332 \
  -e BITCOIN_ZMQ_PUBRAWBLOCK_PORT=28333 \
  anax32/lnd
```

## cluster

see `./docker-compose.yaml` for an example of a bitcoin node and lnd node orchestration.

note that the number of replicas for the lightning nodes should included in the
`ln-node` port range (`8080-8080+(num-replicas):8080`)

# notes

test the connections to the bitcoin node by execing into the container
and using `nc` with the environment variables.

```bash
docker exec -it lnd-node /bin/bash
nc -v -z ${BITCOIN_ZMQ_IP}:${BITCOIN_ZMQ_PUBRAWBLOCK_PORT}
nc -v -z ${BITCOIN_ZMQ_IP}:${BITCOIN_ZMQ_PUBRAWTX_PORT}
nc -v -z ${BITCOIN_RCP_HOST}:${BITCOIN_RPC_PORT}
```

all `nc` calls should report `<ip>:<port> open`
