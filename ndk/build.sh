#!/bin/bash
set -e

NDK_PROJECT_PATH=$(pwd)
APP_BUILD_SCRIPT="$NDK_PROJECT_PATH/ndk/Android.mk"
APP_PLATFORM=android-21
APP_ABI="armeabi-v7a:arm64-v8a"

echo "[NDK-BUILD] Building .so for armeabi-v7a and arm64-v8a..."

$ANDROID_NDK_HOME/ndk-build \
  NDK_PROJECT_PATH="$NDK_PROJECT_PATH" \
  APP_BUILD_SCRIPT="$APP_BUILD_SCRIPT" \
  APP_PLATFORM=$APP_PLATFORM \
  APP_ABI="$APP_ABI" \
  NDK_APPLICATION_MK="$NDK_PROJECT_PATH/ndk/Application.mk" \
  -C ndk

echo "[NDK-BUILD] Moving .so files to lib/android/..."
mkdir -p lib/android/armeabi-v7a lib/android/arm64-v8a
cp -v ndk/obj/local/armeabi-v7a/*.so lib/android/armeabi-v7a/
cp -v ndk/obj/local/arm64-v8a/*.so lib/android/arm64-v8a/

echo "[NDK-BUILD] Done."
