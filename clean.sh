#!/bin/bash

echo "Cleaning up the project..."

# Remove the build directory
if [ -d "build" ]; then
    echo "Removing build directory..."
    rm -rf build
else
    echo "No build directory found."
fi

# Remove CMake cache files
if [ -f "CMakeCache.txt" ]; then
    echo "Removing CMake cache..."
    rm CMakeCache.txt
fi

# Remove CMake generated files
if [ -d "CMakeFiles" ]; then
    echo "Removing CMake files..."
    rm -rf CMakeFiles
fi

echo "Cleanup complete!"
