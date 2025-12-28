@echo off
setlocal

REM =====================================================
REM Get the directory of this script (absolute path)
REM =====================================================
set "SCRIPT_DIR=%~dp0"
REM Remove trailing backslash
set "SCRIPT_DIR=%SCRIPT_DIR:~0,-1%"

echo Script directory: %SCRIPT_DIR%

REM =====================================================
REM Define important paths (absolute, safe)
REM =====================================================
set "BUILD_DIR=%SCRIPT_DIR%\..\build"
set "SOURCE_DIR=%SCRIPT_DIR%\..\Software"
set "CMAKE_FILE=%SOURCE_DIR%\CMakeLists.txt"

REM =====================================================
REM Clean previous build
REM =====================================================
if exist "%BUILD_DIR%" (
    echo Removing previous build directory...
    rmdir /s /q "%BUILD_DIR%"
)

echo Cleanup complete!
endlocal
