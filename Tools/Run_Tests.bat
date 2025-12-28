@echo off
setlocal

REM =====================================================
REM Get the directory of this script (absolute path)
REM =====================================================
set "SCRIPT_DIR=%~dp0"
set "SCRIPT_DIR=%SCRIPT_DIR:~0,-1%"

echo Script directory: %SCRIPT_DIR%

REM =====================================================
REM Define important paths
REM =====================================================
set "SOURCE_DIR=%SCRIPT_DIR%\..\Software"
set "BUILD_DIR=%SCRIPT_DIR%\..\build"

REM Normalize paths
for %%I in ("%SOURCE_DIR%") do set "SOURCE_DIR=%%~fI"
for %%I in ("%BUILD_DIR%") do set "BUILD_DIR=%%~fI"

echo Source dir: %SOURCE_DIR%
echo Build dir : %BUILD_DIR%

REM =====================================================
REM Clean previous build
REM =====================================================
if exist "%BUILD_DIR%" (
    echo Removing previous build directory...
    rmdir /s /q "%BUILD_DIR%"
)

REM =====================================================
REM Create build directory
REM =====================================================
mkdir "%BUILD_DIR%" 2>nul

cd /d "%BUILD_DIR%" || (
    echo Error: Failed to enter build directory
    exit /b 1
)

REM =====================================================
REM Configure with CMake (MinGW)
REM =====================================================
echo Configuring project...
cmake -G "MinGW Makefiles" "%SOURCE_DIR%" || (
    echo Error: CMake configuration failed
    exit /b 1
)

REM =====================================================
REM Build project
REM =====================================================
echo Building project...
cmake --build . || (
    echo Error: Build failed
    exit /b 1
)

REM =====================================================
REM Run tests via CTest
REM =====================================================
echo Running tests...
ctest --output-on-failure
if errorlevel 1 (
    echo.
    echo ❌ Some tests failed
    exit /b 1
)

echo.
echo ✅ All tests passed!
pause
endlocal
