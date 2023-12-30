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
repopick -f 320142 331660 331661 335203
cd kernel/samsung/exynos5420/
#git revert --no-edit f9c4050256d3be4a4033a1a035bd67ce20e2267f
git fetch https://github.com/bluess57/android_kernel_samsung_exynos5420 lineage-17.1 && git cherry-pick 0a33bd51180bc0c62d9c41b64c66aae49f7556be
git fetch https://github.com/bluess57/android_kernel_samsung_exynos5420 lineage-17.1 && git cherry-pick 8081804700073dd0cbb71c54d8478e9bad43c5f1
#git fetch https://github.com/bluess57/android_kernel_samsung_exynos5420 lineage-18.1 && git cherry-pick 38db33f344863c210b2de5ce22c93712c42aa3da
git fetch https://github.com/bluess57/android_kernel_samsung_exynos5420 lineage-18.1 && git cherry-pick 4799a58ad650ca7dab1f885e8d0e60c552792ef8
cd ../../..

exit 0
