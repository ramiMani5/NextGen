#!/bin/bash

echo "Creating build directory..."
mkdir -p ../build
cd ../build || exit

echo "Running CMake..."
cmake ../Software/

echo "Building the project..."
cmake --build .

# Extract project name from CMakeLists.txt
PROJECT_NAME=$(grep -m 1 "^project(" ../Software/CMakeLists.txt | awk -F'[()]' '{print $2}')

if [ -z "$PROJECT_NAME" ]; then
    echo "Error: Could not determine project name from CMakeLists.txt"
    exit 1
fi

echo "Running the executable..."
../build/"$PROJECT_NAME"

echo "Done!"
