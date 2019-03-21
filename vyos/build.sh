#!/bin/bash
set -euo pipefail

BUILD_BY=${BUILD_BY:-"github@public.swineson.me"}
BUILD_TYPE=${BUILD_TYPE:-"release"}
BUILD_VERSION=${BUILD_VERSION:-"1.2.0"}
IMAGE_NAME=${IMAGE_NAME:-"jamesits/vyos-builder"}
BUILD_SCRIPT_BRANCH=${BUILD_SCRIPT_BRANCH:-crux}

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

if ! [ -x "$(command -v unzip)" ]; then
  sudo apt-get install -y unzip
fi

! rm -rf "vyos-build-${BUILD_SCRIPT_BRANCH}"

# download scripts
curl -L "https://github.com/vyos/vyos-build/archive/${BUILD_SCRIPT_BRANCH}.zip" -o build_script.zip
unzip build_script.zip

# build image
pushd "vyos-build-${BUILD_SCRIPT_BRANCH}"
echo "configuring..."
docker run --rm --privileged -v $(pwd):/vyos -w /vyos "${DOCKER_IMAGE}:${BUILD_SCRIPT_BRANCH}" ./configure --architecture amd64 --build-by "${BUILD_BY}" --build-type "${BUILD_TYPE}" --version "${BUILD_VERSION}"

for var in "$@"
do
    echo "Building $var..."
    
    # do not set -j
    docker run --rm --privileged -v $(pwd):/vyos -w /vyos "${DOCKER_IMAGE}:${BUILD_SCRIPT_BRANCH}" make "${var}"
done

# collect artifacts
if [ -z ${BUILD_ARTIFACTSTAGINGDIRECTORY+x} ]; then 
   echo "Environment variable BUILD_ARTIFACTSTAGINGDIRECTORY is unset, skipping"
else
   ls -alh build/
   
   # recurse intentionally disabled
   cp build/* ${BUILD_ARTIFACTSTAGINGDIRECTORY}
fi

