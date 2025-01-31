#!/bin/bash

MODULE="${1}"
ARCH="${2:-x86_64}"
TAG="${3}"

echo "🌿 Module(${MODULE})"
echo "🦑 Arch(${ARCH})"
echo "🏷️ Tag(${TAG})"

if [[ -n ${TAG} ]] ; then
    TAG=$(echo ${TAG} | cut -d '/' -f2)
fi

echo "🏷️ Tag(${TAG})"

if [[ ${MODULE} == "redis_timeseries" ]] ; then

    if [[ -z ${TAG} || ${TAG} == "master" ]] ; then
        TAG="v1.12.5"
        echo "Using default tag(${TAG})"
    fi

    echo "🐏 Cloning ..."
    git clone --quiet --single-branch --branch="${TAG}" --depth=1 --recursive "https://github.com/RedisTimeSeries/RedisTimeSeries.git"
    pushd "RedisTimeSeries"
    git checkout --quiet --detach "${TAG}"
    git describe --tags

    ./deps/readies/bin/getpy3
    ./system-setup.py

    echo "🔨 Building ..."
    make setup
    make build
    popd

    echo "🧊 Packing ..."
    find . -type f -name "redis*.so" -exec gzip -v {} -c > "redis_timeseries-linux-${ARCH}-${TAG}.gz" \;
fi

if [[ ${MODULE} == "redis" ]] ; then

    if [[ -z ${TAG} || ${TAG} == "master" ]] ; then
        TAG="7.2.7"
        echo "Using default tag(${TAG})"
    fi

    echo "🐏 Cloning ..."
    git clone --quiet --single-branch --branch="${TAG}" --depth=1 "https://github.com/redis/redis.git"
    pushd "redis"
    git checkout --quiet --detach "${TAG}"
    git describe --tags

    echo "🔨 Building ..."
    make clean
    make PREFIX=${PWD}/install BUILD_TLS=yes USE_SYSTEMD=yes MALLOC=libc install
    popd

    echo "🧊 Packing ..."
    tar -cvzf "redis-linux-${ARCH}-${TAG}.tar.gz" -C "./redis/install" .
fi

echo "✨ Done"