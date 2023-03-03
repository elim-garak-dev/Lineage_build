#!/bin/bash

set -e

function privpick() {
  git -C $1 fetch github $2
  git -C $1 cherry-pick FETCH_HEAD
}

function checkchain() {
  git -C $1 fetch github $2
  git -C $1 checkout FETCH_HEAD
}

source build/envsetup.sh

# -------------- PLATFORM STUFF --------------

repopick -g https://review.exynos5420.com 8454-8459 8462
repopick -f 319486 325295 349386
cd device/samsung/chagallwifi/ && git fetch "https://github.com/exynos5420/android_device_samsung_chagallwifi" refs/changes/05/8405/2 && git cherry-pick FETCH_HEAD && cd ../../..
cd vendor/samsung/chagallwifi/ && git fetch "https://github.com/exynos5420/android_vendor_samsung_chagallwifi" refs/changes/06/8406/1 && git cherry-pick FETCH_HEAD && cd ../../..
cd kernel/samsung/exynos5420/
git revert --no-edit f9c4050256d3be4a4033a1a035bd67ce20e2267f
git fetch https://github.com/bluess57/android_kernel_samsung_exynos5420 lineage-17.1 && git cherry-pick 0a33bd51180bc0c62d9c41b64c66aae49f7556be
git fetch https://github.com/bluess57/android_kernel_samsung_exynos5420 lineage-17.1 && git cherry-pick 8081804700073dd0cbb71c54d8478e9bad43c5f1
cd ../../..
exit 0
