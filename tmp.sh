#!/bin/bash

rm -rf .repo/local_manifests

repo init -u https://github.com/yaap/manifest.git -b fifteen --git-lfs

git clone https://github.com/stuffbykoko/local_manifests -b yaap .repo/local_manifests

repo sync -j$(nproc --all) --no-tags --no-clone-bundle --current-branch

echo "LET'S GO!"

source build/envsetup.sh

lunch yaap_a52q-user && mka bacon
