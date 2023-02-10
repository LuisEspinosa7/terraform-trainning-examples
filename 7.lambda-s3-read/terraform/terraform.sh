#!/bin/sh

set -e

cd ../s3
pip3 install -r requirements.txt

cd ../terraform
terraform apply