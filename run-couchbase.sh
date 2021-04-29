#!/bin/sh

set -e
set -x


################

echo "*** Creating Docker bridge network..."

NETWORK=sandbox

docker network create ${NETWORK} || true

################

echo "*** Starting Couchbase..."

docker run -d --name couchbase -p 8091-8094:8091-8094 -p 11210:11210 --network=${NETWORK} \
    couchbase/server:enterprise-6.6.2

