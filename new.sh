#!/bin/bash

rm -rf .repo/local_manifests

repo init -u https://github.com/stuffbykoko/manifest -b vauxite

git clone https://github.com/stuffbykoko/local_manifests -b vauxite .repo/local_manifests

repo sync -c --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune -j$(nproc --all)
