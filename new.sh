#!/bin/bash

repo init -u https://github.com/yaap/manifest.git -b fifteen --git-lfs

repo sync -c --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune -j$(nproc --all)
