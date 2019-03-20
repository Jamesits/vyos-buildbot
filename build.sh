#!/bin/bash
set -euo pipefail

BUILD_SCRIPT_BRANCH=crux
BUILD_BY="github@public.swineson.me"
BUILD_TYPE=release
BUILD_VERSION=1.2.0

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

# run environment
docker run --rm -it --privileged -v $(pwd):/vyos -w /vyos vyos-builder ./configure --architecture amd64 --build-by "${BUILD_BY}" --build-type "${BUILD_TYPE} --version "${BUILD_VERSION}"
make -j iso
