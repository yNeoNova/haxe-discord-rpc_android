#!/bin/bash
set -e

NDK_PROJECT_PATH=$(pwd)

$ANDROID_NDK_HOME/ndk-build \
  NDK_PROJECT_PATH="$NDK_PROJECT_PATH" \
  APP_BUILD_SCRIPT="$NDK_PROJECT_PATH/ndk/Android.mk" \
  NDK_APPLICATION_MK="$NDK_PROJECT_PATH/ndk/Application.mk" \
  APP_PLATFORM=android-21 \
  APP_ABI="armeabi-v7a arm64-v8a" \
  -C ndk

mkdir -p lib/android/armeabi-v7a lib/android/arm64-v8a
cp -v ndk/obj/local/armeabi-v7a/*.so lib/android/armeabi-v7a/
cp -v ndk/obj/local/arm64-v8a/*.so lib/android/arm64-v8a/

echo "Build complete."
