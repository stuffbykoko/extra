#!/bin/bash

rm -rf .repo/local_manifests
rm -rf out/soong/*.glob*

repo init -u https://github.com/AxionAOSP/android.git -b lineage-22.1 --git-lfs

git clone https://github.com/stuffbykoko/local_manifests -b axion .repo/local_manifests

repo sync -c --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune -j$(nproc --all)

