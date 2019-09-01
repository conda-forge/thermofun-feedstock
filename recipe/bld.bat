mkdir build
cd build

if "%VS_MAJOR%" == "9" (
ECHO VS 2008
) 
else (
REM This is a fix for a CMake bug where it crashes because of the "/GL" flag
REM See: https://gitlab.kitware.com/cmake/cmake/issues/16282
set CXXFLAGS=%CXXFLAGS:-GL=%
set CFLAGS=%CFLAGS:-GL=% 
)

cmake .. ^
    -GNinja ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DCMAKE_VERBOSE_MAKEFILE=ON
if errorlevel 1 exit 1

REM Build step
ninja
if errorlevel 1 exit 1
