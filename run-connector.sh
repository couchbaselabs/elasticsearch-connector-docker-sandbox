#!/bin/sh

set -e
set -x

cd docker
docker-compose build
docker-compose up -d
