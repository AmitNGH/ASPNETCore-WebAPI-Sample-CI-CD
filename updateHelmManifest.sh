#!/bin/bash

set -x

git clone "https://$1@github.com/AmitNGH/ASPNETCore-WebAPI-Sample-CI-CD.git" /tmp/temp_repo

cd /tmp/temp_repo

sed -i "s|^\(\s*tag:\s*\).*|\1$2|g" ./sample-app/values.yaml

git add .

git commit -m "Update Helm manifest [skip ci]"

git push

rm -rf /tmp/temp_repo