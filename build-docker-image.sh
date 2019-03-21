#!/bin/bash
set -euo pipefail

BUILD_IMAGE_NAME=${BUILD_IMAGE_NAME:-"vyos-builder"}
BUILD_SCRIPT_BRANCH=${BUILD_SCRIPT_BRANCH:-crux}

if ! [ -x "$(command -v unzip)" ]; then
  sudo apt-get install -y unzip
fi

! rm -rf "vyos-build-${BUILD_SCRIPT_BRANCH}"

# download scripts
curl -L "https://github.com/vyos/vyos-build/archive/${BUILD_SCRIPT_BRANCH}.zip" -o build_script.zip
unzip build_script.zip

# build environment
pushd "vyos-build-${BUILD_SCRIPT_BRANCH}"
docker build -t ${BUILD_IMAGE_NAME}:${BUILD_SCRIPT_BRANCH} docker
popd
