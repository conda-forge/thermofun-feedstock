#!/bin/bash

export CPATH=$PREFIX/include

mkdir build
cd build

# Configure step
cmake .. \
    -GNinja \
    -DTHERMOFUN_PYTHON_INSTALL_PREFIX=$PREFIX \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_PREFIX_PATH=$PREFIX \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON \

# Build step
ninja install
