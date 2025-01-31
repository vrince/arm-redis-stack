#!/bin/bash

ARCH="${1:-x86_64}"
DISTRO="${2}"
TAG="${3}"

echo "🦑 Arch(${ARCH})"
echo "🫀 Distro(${DISTRO})"
echo "🏷️ Tag(${TAG})"

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
tar -cvzf "redis-linux-${ARCH}-${DISTRO}-${TAG}.tar.gz" -C "./redis/install" .


echo "✨ Done"