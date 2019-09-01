mkdir build
cd build

cmake .. ^
    -GNinja ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DCMAKE_VERBOSE_MAKEFILE=ON
if errorlevel 1 exit 1

REM Build step
ninja -v bootcd
if errorlevel 1 exit 1
