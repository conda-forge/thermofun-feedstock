#!/bin/bash
mkdir build
cd build
python_path=$(which python)
# Configure step
cmake -GNinja .. -DPYTHON_EXECUTABLE:FILEPATH=$python_path \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib

# Build step
ninja install
