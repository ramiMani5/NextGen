#!/bin/bash

echo "Creating build directory..."
mkdir -p build
cd build || exit

echo "Running CMake..."
cmake ..

echo "Building the project..."
cmake --build .

echo "Running the executable..."
./MyProject

echo "Done!"
