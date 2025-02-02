#!/bin/bash

echo "Creating build directory..."
mkdir -p ../build
cd ../build || exit

echo "Running CMake..."
cmake ../Software/

echo "Building the project..."
cmake --build .

echo "Running the executable..."
../build/NextGen

echo "Done!"
