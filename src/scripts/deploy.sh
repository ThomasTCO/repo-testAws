#!/bin/bash

set -e

WORKDIR=$(pwd)
LAMBDA_DEPLOY="lambda-test"


echo "Deploying Lambdas 1 & 2"

cd $WORKDIR/src/demo-lambda/python/
sls deploy --userenv dev --name $LAMBDA_DEPLOY --region eu-west-3 --force --log-level debug

echo "Done with deploying lambdas 1 & 2"