mkdir build
cd build

echo "Configuring..."
cmake .. -S . -B build
echo "Building..."
cmake .. --build build --config %CONFIGURATION% --target install
