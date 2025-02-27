#!/bin/bash

rm -rf .repo/local_manifests

repo init -u https://github.com/PixelOS-AOSP/manifest.git -b fifteen --git-lfs

git clone https://github.com/stuffbykoko/local_manifests -b pos .repo/local_manifests

repo sync -c --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune -j$(nproc --all)

source build/envsetup.sh

export BUILD_USERNAME=nobody
export BUILD_HOSTNAME=android

breakfast a52q && mka installclean && mka bacon
