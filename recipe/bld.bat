mkdir build
cd build

REM Configure step
cmake -G ^
      -DCMAKE_BUILD_TYPE=Release ^
      -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
      -DCMAKE_INCLUDE_PATH:PATH="%LIBRARY_INC%" ^
      -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON ^
      ..

if errorlevel 1 exit 1

REM Build!
nmake
if errorlevel 1 exit 1

REM Install!
nmake install
if errorlevel 1 exit 1
