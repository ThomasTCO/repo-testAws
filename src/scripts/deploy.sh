#!/bin/bash

set -e

WORKDIR=$(pwd)


echo "Deploying Lambdas 1 & 2"

cd $WORKDIR/src/demo-lambda/python/
for lambda in $(ls .); do
    echo "Deploying $lambda"
    sls deploy --variant lab --statictarget $STATIC_TAR --object $lambda
done


#echo "Lambda 1 deploy"
#cd $WORKDIR/src/demo-lambda/python/lambda-test1
#sls deploy --variant lab --region eu-west-3 --force --log-level debug

#echo "Lambda 2 deploy"
#cd $WORKDIR/src/demo-lambda/python/lambda-test2
#sls deploy --variant lab --region eu-west-3 --force --log-level debug

echo "Done with deploying lambdas 1 & 2"