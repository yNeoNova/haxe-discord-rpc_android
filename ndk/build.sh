#!/bin/bash

echo "[NDK-BUILD] Building .so for armeabi-v7a and arm64-v8a..."

# Build armeabi-v7a
APP_ABI=armeabi-v7a ndk-build NDK_PROJECT_PATH=. APP_BUILD_SCRIPT=./Android.mk APP_PLATFORM=android-21 || exit 1

# Build arm64-v8a
APP_ABI=arm64-v8a ndk-build NDK_PROJECT_PATH=. APP_BUILD_SCRIPT=./Android.mk APP_PLATFORM=android-21 || exit 1

# Create output folders if missing
mkdir -p lib/android/armeabi-v7a
mkdir -p lib/android/arm64-v8a

echo "[COPY] Copying .so files to lib/android folders..."

# Copy .so files from ndk/libs (NDK output directory) to our lib folder
cp ndk/libs/armeabi-v7a/*.so lib/android/armeabi-v7a/ || { echo "Failed to copy armeabi-v7a .so files"; exit 1; }
cp ndk/libs/arm64-v8a/*.so lib/android/arm64-v8a/ || { echo "Failed to copy arm64-v8a .so files"; exit 1; }

echo "[DONE] Build and copy completed successfully."
