#!/bin/bash

ARCH="${1}"
TAG="${2}"

echo "🦑 Arch(${ARCH})"

if [[ -z ${TAG} || ${TAG} == "master" ]] ; then
    TAG="v1.6.9"
    echo "Using default tag(${TAG})"
fi

echo "Tag(${TAG})"
echo "🐏 Cloning RedisTimeSeries .."

git clone --quiet --single-branch --branch="${TAG}" --depth=1 --recursive "https://github.com/RedisTimeSeries/RedisTimeSeries.git"
pushd "RedisTimeSeries"
git checkout --quiet --detach "${TAG}"
git describe --tags

echo "🔨 Building ..."
make setup
make build

popd

echo "🧊 Packing ..."
find . -type f -name "redis*.so" -exec gzip -v {} -c > "redis-timeseries-linux-${ARCH}-${TAG}.gz" \;
