#!/bin/bash

repo init -u https://github.com/stuffbykoko/manifest -b vauxite

repo sync -c --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune -j$(nproc --all)

rm -rf vendor/qcom/common/vendor/display/5.15
