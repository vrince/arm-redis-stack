#!/bin/bash

TAG="${1}"

if [[ -z ${TAG} || ${TAG} == "master" ]] ; then
    TAG="v1.6.9"
    echo "Using default tag(${TAG})"
fi

echo "Cloning RedisTimeSeries git tag(${TAG})"
git clone --quiet --single-branch --branch="${TAG}" --depth=1 --recursive "https://github.com/RedisTimeSeries/RedisTimeSeries.git"
pushd "RedisTimeSeries"
git checkout --quiet --detach "${TAG}"
git describe --tags

#make setup
make build

popd
