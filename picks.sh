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

repopick 320142 320337 321934 318814-318817 320525 320534-320540 320542-320546 331660 331661 335203
repopick -f 326385 && repopick -f -P system/bpf 320591 && repopick -f -P system/netd 320592 && repopick -f -P art 318097 && repopick -f 287706 -P external/perfetto
cd frameworks/base/ && git fetch https://github.com/elim-garak-dev/android_frameworks_base lineage-19.1 && git cherry-pick baa916c1581814bd075ec39de2e008b054b5c2d2 && cd ../..
cd frameworks/av/ && git fetch https://github.com/elim-garak-dev/android_frameworks_av lineage-19.1 && git cherry-pick 9115090175ac4226aa51040f58fdf81dedac1b0c && cd ../..
cd hardware/samsung_slsi/exynos5420/ && git fetch "https://github.com/exynos5420/android_hardware_samsung_slsi_exynos5420" refs/changes/09/8409/1 && git cherry-pick FETCH_HEAD && cd ../../..

exit 0
