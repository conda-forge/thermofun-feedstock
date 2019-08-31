mkdir build
cd build

REM Configure step
cmake .. ^
    -GNinja ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
    -DCMAKE_INCLUDE_PATH:PATH="%LIBRARY_INC%" ^
    -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON

REM Build step
ninja install
