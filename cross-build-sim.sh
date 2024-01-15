#!/bin/bash

SCRIPT_DIR="$(dirname "$(realpath "${0}")")"
BUILD=${1:-${SCRIPT_DIR}/build}

export LANG=C
export TARGET="aarch64-kos"
export BOARD="RPI4_BCM2711"
export PKG_CONFIG=""
export SDK_PREFIX="/opt/KasperskyOS-Community-Edition-1.2.0.45"
export INSTALL_PREFIX="$BUILD/../install"
export PATH="$SDK_PREFIX/toolchain/bin:$SDK_PREFIX/toolchain/lib:$PATH"
export LD_LIBRARY_PATH="$SDK_PREFIX/toolchain/lib:$LD_LIBRARY_PATH"

export BUILD_WITH_CLANG=
export BUILD_WITH_GCC=

TOOLCHAIN_SUFFIX=""

if [ "$BUILD_WITH_CLANG" == "y" ];then
    TOOLCHAIN_SUFFIX="-clang"
fi

if [ "$BUILD_WITH_GCC" == "y" ];then
    TOOLCHAIN_SUFFIX="-gcc"
fi

"$SDK_PREFIX/toolchain/bin/cmake" -G "Unix Makefiles" -B "$BUILD" \
      -D BSP_CONFIG_NAME=rpi4_bcm2711.default \
      --no-warn-unused-cli \
      -D CMAKE_BUILD_TYPE:STRING=Debug \
      -D CMAKE_INSTALL_PREFIX:STRING="$INSTALL_PREFIX" \
      -D CMAKE_FIND_ROOT_PATH="$([[ -f "$SCRIPT_DIR/additional_cmake_find_root.txt" ]] && cat "$SCRIPT_DIR/additional_cmake_find_root.txt")$PREFIX_DIR/sysroot-$TARGET" \
      -D BOARD="$BOARD" \
      -D CMAKE_TOOLCHAIN_FILE="$SDK_PREFIX/toolchain/share/toolchain-$TARGET$TOOLCHAIN_SUFFIX.cmake" \
      "$SCRIPT_DIR/" && "$SDK_PREFIX/toolchain/bin/cmake" --build "$BUILD" --target sim
