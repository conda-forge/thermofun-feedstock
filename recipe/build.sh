#!/bin/bash

set -u
ferr(){
    echo "$@"
    exit 1
}

mkdir -p build
cd build

# Use autodiff when its package is installed (none exists for linux-aarch64,
# linux-ppc64le or python 3.15). Without it, derivatives (ddt and ddp) are 0.
AUTODIFF=OFF
if [ -n "$(find "$PREFIX" -iname 'autodiff*config.cmake' 2>/dev/null | head -1)" ]; then
    AUTODIFF=ON
fi
echo "TFUN_USE_AUTODIFF=${AUTODIFF}"

# Configure step
cmake -DPYTHON_EXECUTABLE:FILEPATH="$PYTHON" \
      -DTHERMOFUN_PYTHON_INSTALL_PREFIX="$PREFIX" \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX="$PREFIX" \
      -DCMAKE_INSTALL_LIBDIR=$PREFIX/lib \
      -DTFUN_USE_AUTODIFF=${AUTODIFF} \
      ..
# Build step
make -j${CPU_COUNT}
make install
