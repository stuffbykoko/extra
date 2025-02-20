#!/bin/bash

rm -rf .repo/local_manifests
rm -rf out/soong/*.glob*

repo init -u https://github.com/PixelOS-AOSP/manifest.git -b fifteen --git-lfs

git clone https://github.com/stuffbykoko/local_manifests -b pos .repo/local_manifests

/opt/crave/resync.sh

echo "LET'S GO!"

source build/envsetup.sh

export BUILD_USERNAME=nobody
export BUILD_HOSTNAME=crave

breakfast a52q && mka installclean && mka bacon

curl bashupload.com -T out/target/product/a52q/PixelOS*.zip
