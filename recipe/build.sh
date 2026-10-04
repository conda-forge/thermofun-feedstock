#!/bin/bash

set -u
ferr(){
    echo "$@"
    exit 1
}

mkdir -p build
cd build

# No autodiff package exists for these platforms: build without derivatives
# (ddt and ddp are 0), the same way the installed config then does not ask for autodiff.
AUTODIFF=ON
case "${target_platform}" in
    linux-aarch64|linux-ppc64le) AUTODIFF=OFF ;;
esac

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
