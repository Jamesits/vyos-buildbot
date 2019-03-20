#!/bin/bash
set -euo pipefail

BUILD_SCRIPT_BRANCH=${BUILD_SCRIPT_BRANCH:-crux}

# download scripts
mkdir -p /tmp/vyos-build
pushd /tmp
sudo apt-get install -y unzip
curl -L "https://github.com/vyos/vyos-build/archive/${BUILD_SCRIPT_BRANCH}.zip" -o build_script.zip
unzip build_script.zip
rm build_script.zip

# build environment
pushd ./*
docker build -t vyos-builder docker
popd

popd