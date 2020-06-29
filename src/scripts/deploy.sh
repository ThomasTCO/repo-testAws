#!/bin/bash

set -e

WORKDIR=$(pwd)


echo "Deploying Lambdas 1 & 2"
pwd
echo "Lambda 1 deploy"
cd $WORKDIR/src/demo-lambda/python/lambda-test-1
sls deploy --variant lab --region eu-west-3 --force --log-level debug

echo "Lambda 2 deploy"
cd $WORKDIR/src/demo-lambda/python/lambda-test-2
sls deploy --variant lab --region eu-west-3 --force --log-level debug

echo "Done with deploying lambdas 1 & 2"