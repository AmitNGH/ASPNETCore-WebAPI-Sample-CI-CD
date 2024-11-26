#!/bin/bash

set -x

GITHUB_TOKEN=$1

git clone "https://$1@github.com/AmitNGH/ASPNETCore-WebAPI-Sample-CI-CD.git" /tmp/temp_repo

cd /tmp/temp_repo

sed -i "s|image\.tag: .*|image.tag: $2|g" sample-app/values.yaml

git add .

git commit -m "Update Helm manifest"

git push

rm -rf /tmp/temp_repo