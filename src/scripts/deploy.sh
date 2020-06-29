#!/bin/bash

set -e

WORKDIR=$(pwd)
NUM_COMPTE='284952015401'


echo "Deploying Hello World..."
cd $WORKDIR/src/demo-lambda/python/
sls deploy --variant lab --region eu-west-3 --force --log-level debug
sls_status=$?
echo "Done with deploying Hello World..."