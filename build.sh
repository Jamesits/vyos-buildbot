#!/bin/bash
set -euo pipefail

BUILD_BY=${BUILD_BY:-"github@public.swineson.me"}
BUILD_TYPE=${BUILD_TYPE:-"release"}
BUILD_VERSION=${BUILD_VERSION:-"1.2.0"}
DOCKER_IMAGE=${DOCKER_IMAGE:-"vyos-builder"}

echo "configuring..."
docker run --rm --privileged -v $(pwd):/vyos -w /vyos "${DOCKER_IMAGE}" ./configure --architecture amd64 --build-by "${BUILD_BY}" --build-type "${BUILD_TYPE}" --version "${BUILD_VERSION}"

for var in "$@"
do
    echo "Building $var..."
    docker run --rm --privileged -v $(pwd):/vyos -w /vyos "${DOCKER_IMAGE}" make -j "${var}"
done

