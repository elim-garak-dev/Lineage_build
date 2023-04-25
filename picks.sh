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

#repopick 320142 320337 321934 318814-318817 320525 320534-320540 320542-320546 331660 331661 335203
#repopick -t S_asb_2023-02
repopick -f 320142 320546 321934 318817 326385 331660 331661 335203 && repopick -f -P system/bpf 320591 && repopick -f -P system/netd 320592 && repopick -f -P art 318097 && repopick -f 287706 -P external/perfetto
cd device/samsung/chagall-common/
git fetch "ssh://garak@review.exynos5420.com:29418/exynos5420/android_device_samsung_chagall-common" refs/changes/37/8537/2 && git cherry-pick FETCH_HEAD
cd ../../..
cd kernel/samsung/exynos5420/
git fetch https://github.com/bluess57/android_kernel_samsung_exynos5420 lineage-17.1 && git cherry-pick 0a33bd51180bc0c62d9c41b64c66aae49f7556be
git fetch https://github.com/bluess57/android_kernel_samsung_exynos5420 lineage-17.1 && git cherry-pick 8081804700073dd0cbb71c54d8478e9bad43c5f1
#git fetch https://github.com/bluess57/android_kernel_samsung_exynos5420 lineage-18.1 && git cherry-pick 38db33f344863c210b2de5ce22c93712c42aa3da
git fetch https://github.com/bluess57/android_kernel_samsung_exynos5420 lineage-18.1 && git cherry-pick 4799a58ad650ca7dab1f885e8d0e60c552792ef8
git fetch "ssh://garak@review.exynos5420.com:29418/exynos5420/android_kernel_samsung_exynos5420" refs/changes/27/8527/2 && git cherry-pick FETCH_HEAD
git fetch "ssh://garak@review.exynos5420.com:29418/exynos5420/android_kernel_samsung_exynos5420" refs/changes/28/8528/3 && git cherry-pick FETCH_HEAD
git fetch "ssh://garak@review.exynos5420.com:29418/exynos5420/android_kernel_samsung_exynos5420" refs/changes/29/8529/2 && git cherry-pick FETCH_HEAD
cd ../../..

exit 0
