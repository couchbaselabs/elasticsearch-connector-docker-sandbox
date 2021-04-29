# Elasticsearch Connector Docker Sandbox

For experimenting with running the Couchbase Elasticsearch connector in Docker.

## Prerequisites

* Docker
* bash
* an Internet connection

## Run Couchbase Server

0. If Couchbase Server is running locally, stop it.

1. Start the Couchbase Docker container:

       ./run-couchbase.sh

2. Visit http://localhost:8091/ and set up a new cluster with username `Administrator` and password `password`.
Optional: Configure disk, memory & services; reduce the Data service memory quota to 512 MB and disable all other services.

3. In the Couchbase web UI, go to the "Buckets" section and follow the link to add sample buckets.
Add the `travel-sample` bucket.

## Run Elasticsearch and the connector

1. Start Elasticsearch and the Couchbase Elasticsearch connector:

       ./run-connector.sh

Watch the console output of Elasticsearch with this command:

    docker logs -f elasticsearch

Watch the console output of the connector with this command:

    docker logs -f connector


## Clean up

When you're done with the demo, remove the Docker containers:

    ./cleanup.sh
