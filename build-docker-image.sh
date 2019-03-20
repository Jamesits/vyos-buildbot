#!/bin/bash
set -euo pipefail

BUILD_IMAGE_NAME=${BUILD_IMAGE_NAME:-"vyos-builder"}
BUILD_SCRIPT_BRANCH=${BUILD_SCRIPT_BRANCH:-crux}

# download scripts
mkdir -p /tmp/vyos-build
pushd /tmp/vyos-build
sudo apt-get install -y unzip
curl -L "https://github.com/vyos/vyos-build/archive/${BUILD_SCRIPT_BRANCH}.zip" -o build_script.zip
unzip build_script.zip
rm build_script.zip

# build environment
pushd ./*
docker build -t ${BUILD_IMAGE_NAME}:${BUILD_SCRIPT_BRANCH} docker
popd

popd
