#!/bin/bash

rm -rf .repo/local_manifests

repo init -u https://github.com/yaap/manifest.git -b fifteen --git-lfs

git clone https://github.com/stuffbykoko/local_manifests --depth 1 -b yaap .repo/local_manifests

repo sync -j$(nproc --all) --force-sync --no-tags --no-clone-bundle --current-branch

rm -rf vendor/yaap/signing/keys
git clone https://gitea.com/koko-07870/tmp -b tmp vendor/yaap/signing/keys

echo "LET'S GO!"

source build/envsetup.sh

export FORCE_JSON=1

lunch yaap_a52q-user && m installclean && m yaap
