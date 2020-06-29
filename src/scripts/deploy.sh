#!/bin/bash

set -e

WORKDIR=$(pwd)
NUM_COMPTE='284952015401'


echo "Deploying Hello World..."
echo "FromDir: $WORKDIR"

cd ../demo-lambda/python/
sls deploy --variant lab --region eu-west-3 --force --log-level debug
sls_status=$?
echo "Done with deploying Hello World..."