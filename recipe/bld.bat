mkdir build
cd build

cmake -G Ninja ^
    -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
    -DCMAKE_BUILD_TYPE=Release ^
    ..
ninja install
