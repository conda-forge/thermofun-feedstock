rem Use autodiff when its package is installed (none exists for python 3.15).
rem Without it, derivatives (ddt and ddp) are 0.
set AUTODIFF=OFF
for /f "delims=" %%F in ('dir /s /b "%LIBRARY_PREFIX%\*utodiff*onfig.cmake" 2^>nul') do set AUTODIFF=ON
echo TFUN_USE_AUTODIFF=%AUTODIFF%

mkdir build
cd build

cmake -G Ninja ^
      -DTHERMOFUN_PYTHON_INSTALL_PREFIX="%PREFIX%" ^
      -DCMAKE_BUILD_TYPE=Release ^
      -DTFUN_USE_AUTODIFF=%AUTODIFF% ^
      -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
      -DCMAKE_INCLUDE_PATH:PATH="%LIBRARY_INC%" ^
      -DPython_EXECUTABLE="%PYTHON%" ^
      -DPython_INCLUDE_DIR="%PYTHON_INCLUDE%" ^
      -DPython_LIBRARY="%PYTHON_LIB%" ^
      ..

if errorlevel 1 exit /b 1
ninja install
if errorlevel 1 exit /b 1

