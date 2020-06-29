#!/bin/bash

set -e

WORKDIR=$(pwd)


echo "Deploying Hello World..."

cd $WORKDIR/src/demo-lambda/python/
pwd
sls deploy --variant lab --region eu-west-3 --force --log-level debug
sls_status=$?
echo "Done with deploying Hello World..."