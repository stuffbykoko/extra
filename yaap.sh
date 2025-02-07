#!/bin/bash

rm -rf .repo/local_manifests

repo init -u https://github.com/yaap/manifest.git -b fifteen --git-lfs

git clone https://github.com/stuffbykoko/local_manifests --depth 1 -b yaap .repo/local_manifests

cd prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9
git reset --hard
git clean -fd
cd -

/opt/crave/resync.sh

rm -rf vendor/yaap/signing/keys
git clone https://gitea.com/koko-07870/tmp -b tmp vendor/yaap/signing/keys

echo "LET'S GO!"

source build/envsetup.sh

lunch yaap_a52q-user && m installclean && m yaap

rm -rf out/target/product/a52q/a52q.json
export FORCE_JSON=1
bash vendor/yaap/tools/generate_json_build_info.sh out/target/product/a52q/YAAP*.zip
