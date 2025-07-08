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
  
# mkdir -p lib/android/armeabi-v7a
# mkdir -p lib/android/arm64-v8a

# Move the compiled .so files from ndk/libs to lib/android folders
mv *.so lib/android/armeabi-v7a/
mv *.so lib/android/arm64-v8a/

echo "Build and move complete."
