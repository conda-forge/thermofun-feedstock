mkdir build
cd build

if "%VS_MAJOR%" == "9" (
ECHO VS 2008
) else (
REM This is a fix for a CMake bug where it crashes because of the "/GL" flag
REM See: https://gitlab.kitware.com/cmake/cmake/issues/16282
set CXXFLAGS=%CXXFLAGS:-GL=%
set CFLAGS=%CFLAGS:-GL=% 
)

cmake .. ^
    -GNinja ^
    -DTHERMOFUN_PYTHON_INSTALL_PREFIX:PATH="%PREFIX%" ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
    -DCMAKE_INCLUDE_PATH:PATH="%LIBRARY_INC%" ^
    -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON ^
if errorlevel 1 exit 1

REM Build step
ninja install
if errorlevel 1 exit 1
