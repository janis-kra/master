#!/bin/bash

touch perf-test-$7/performance-$6.csv

docker-compose run -e EXPERIMENT_SIZE=$1 \
    -e BUFFER_SIZE=$3 \
    -e LIVE_BUFFER_SIZE=$4 \
    -e READ_BATCH=$5 \
    -d --rm event-generator

docker-compose run -e STREAM=performance-$1\
    -e GROUP=performance \
    -e EXPECTED_AMOUNT=$1 \
    -e BUFFER_SIZE=$2 \
    --rm evt-es-bridge \
> perf-test-$7/performance-$6.csv

echo "running performance test with $1 events, client-side buffersize $2, server-side buffersize $3, live buffer size $4, read batch size $5"
cat perf-test-$7/performance-$6.csv

