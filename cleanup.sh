#!/bin/sh

set -x

docker-compose -f docker/docker-compose.yml down -v

docker stop couchbase
docker rm couchbase

docker network rm sandbox
