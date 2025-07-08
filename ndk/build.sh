#!/bin/bash

echo "[NDK-BUILD] Building .so for armeabi-v7a and arm64-v8a..."

# Build armeabi-v7a
APP_ABI=armeabi-v7a ndk-build NDK_PROJECT_PATH=. APP_BUILD_SCRIPT=ndk/Android.mk APP_PLATFORM=android-21 || exit 1

# Build arm64-v8a
APP_ABI=arm64-v8a ndk-build NDK_PROJECT_PATH=. APP_BUILD_SCRIPT=ndk/Android.mk APP_PLATFORM=android-21 || exit 1

echo "[DEBUG] Listing all .so files in project..."
find . -name "*.so"

echo "[COPY] Copying .so files to lib/android folders..."

for arch in armeabi-v7a arm64-v8a x86 x86_64; do
    mkdir -p lib/android/$arch
    cp -v ndk/libs/$arch/*.so lib/android/$arch/ || echo "[WARN] No .so files found for $arch"
done
