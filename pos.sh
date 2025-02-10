#!/bin/bash

rm -rf .repo/local_manifests

repo init -u https://github.com/PixelOS-AOSP/manifest.git -b fifteen --git-lfs

git clone https://github.com/stuffbykoko/local_manifests -b pos .repo/local_manifests

/opt/crave/resync.sh

rm -rf vendor/aosp/signing/keys
git clone https://gitea.com/koko-07870/tmp -b tmp vendor/aosp/signing/keys

echo "LET'S GO!"

source build/envsetup.sh

breakfast a52q && mka installclean && mka bacon

curl bashupload.com -T out/target/product/a52q/PixelOS*.zip
