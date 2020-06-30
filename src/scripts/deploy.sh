#!/bin/bash

set -e

WORKDIR=$(pwd)
LAMBDA_DEPLOY="lambda-test"


echo "Deploying Lambdas 1 & 2"

cd $WORKDIR/src/demo-lambda/python/
#for lambda in $(ls .); do
sls deploy --userenv dev --name $LAMBDA_DEPLOY --region eu-west-3 --force --log-level debug
#done


#echo "Lambda 1 deploy"
#cd $WORKDIR/src/demo-lambda/python/lambda-test1
#sls deploy --variant lab --region eu-west-3 --force --log-level debug

#echo "Lambda 2 deploy"
#cd $WORKDIR/src/demo-lambda/python/lambda-test2
#sls deploy --variant lab --region eu-west-3 --force --log-level debug

echo "Done with deploying lambdas 1 & 2"