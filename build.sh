#!/bin/bash
set -euo pipefail

BUILD_BY="github@public.swineson.me"
BUILD_TYPE=release
BUILD_VERSION=1.2.0

# download scripts
pushd /tmp
apt-get install -y unzip
curl -L https://github.com/vyos/vyos-build/archive/crux.zip -o crux.zip
unzip crux.zip

# build environment
pushd vyos-build-crux
docker build -t vyos-builder docker
popd

popd

# run environment
docker run --rm -it --privileged -v $(pwd):/vyos -w /vyos vyos-builder ./configure --architecture amd64 --build-by "${BUILD_BY}" --build-type "${BUILD_TYPE} --version "${BUILD_VERSION}"
make -j iso
