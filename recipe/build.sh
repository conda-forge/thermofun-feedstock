#!/bin/bash
mkdir build
cd build
# Configure step
cmake -DTHERMOFUN_PYTHON_INSTALL_PREFIX=$PREFIX \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DCMAKE_INSTALL_LIBDIR=lib \
    ..
# Build step
make -j${CPU_COUNT}
make install
