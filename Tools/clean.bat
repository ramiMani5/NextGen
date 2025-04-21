@echo off
echo Cleaning up the project...

REM Remove the build directory
if exist "..\build\" (
    echo Removing build directory...
    rmdir /s /q ..\build
) else (
    echo Build directory does not exist.
)

REM Remove CMake cache file
if exist "CMakeCache.txt" (
    echo Removing CMake cache...
    del /f /q CMakeCache.txt
) else (
    echo No CMakeCache.txt found.
)

REM Remove CMakeFiles directory
if exist "CMakeFiles\" (
    echo Removing CMake files...
    rmdir /s /q CMakeFiles
) else (
    echo No CMakeFiles directory found.
)

echo Cleanup complete!
