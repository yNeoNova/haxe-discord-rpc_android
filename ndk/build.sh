#!/bin/bash

set -e

# Paths
OUT_DIR_ARMEABI=lib/android/armeabi-v7a
OUT_DIR_ARM64=lib/android/arm64-v8a

# Ensure output directories exist
mkdir -p $OUT_DIR_ARMEABI
mkdir -p $OUT_DIR_ARM64

# Build for armeabi-v7a
echo "[NDK-BUILD] Building .so for armeabi-v7a..."
ndk-build NDK_PROJECT_PATH=. APP_BUILD_SCRIPT=./Android.mk APP_PLATFORM=android-21 APP_ABI=armeabi-v7a

# Move .so
echo "[MOVE] Moving libdiscord_rpc.so to $OUT_DIR_ARMEABI/"
find ./libs/armeabi-v7a/ -name "*.so" -exec mv {} $OUT_DIR_ARMEABI/ \;

# Clean intermediate
rm -rf libs/armeabi-v7a

# Build for arm64-v8a
echo "[NDK-BUILD] Building .so for arm64-v8a..."
ndk-build NDK_PROJECT_PATH=. APP_BUILD_SCRIPT=./Android.mk APP_PLATFORM=android-21 APP_ABI=arm64-v8a

# Move .so
echo "[MOVE] Moving libdiscord_rpc.so to $OUT_DIR_ARM64/"
find ./libs/arm64-v8a/ -name "*.so" -exec mv {} $OUT_DIR_ARM64/ \;

# Clean intermediate
rm -rf libs/arm64-v8a

echo "[DONE] Native .so files moved to lib/android/[arch]/"
