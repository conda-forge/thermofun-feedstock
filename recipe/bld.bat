mkdir build
cd build

cmake -G Ninja ^
    -DTHERMOFUN_PYTHON_INSTALL_PREFIX:PATH="%PREFIX%" ^
    -DCMAKE_BUILD_TYPE=Release ^
    ..
ninja install
