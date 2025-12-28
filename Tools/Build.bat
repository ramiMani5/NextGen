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

REM =====================================================
REM Create build directory
REM =====================================================
echo Creating build directory...
mkdir "%BUILD_DIR%" 2>nul

cd /d "%BUILD_DIR%" || (
    echo Error: Failed to enter build directory
    exit /b 1
)

REM =====================================================
REM Run CMake configuration
REM =====================================================
echo Running CMake...
cmake -G "MinGW Makefiles" "%SOURCE_DIR%" || (
    echo Error: CMake configuration failed
    exit /b 1
)

REM =====================================================
REM Build the project
REM =====================================================
echo Building the project...
cmake --build . || (
    echo Error: Build failed
    exit /b 1
)

REM =====================================================
REM Extract project name from CMakeLists.txt (SAFE)
REM =====================================================
set "PROJECT_NAME="

for /f "tokens=2 delims=() " %%A in ('
    findstr /i /r "^project(" "%CMAKE_FILE%"
') do (
    set "PROJECT_NAME=%%A"
    goto :GotProjectName
)


:GotProjectName
if "%PROJECT_NAME%"=="" (
    echo Error: Could not determine project name from CMakeLists.txt
    exit /b 1
)

REM =====================================================
REM Run the executable
REM =====================================================
set "EXE_PATH=%BUILD_DIR%\%PROJECT_NAME%.exe"

if not exist "%EXE_PATH%" (
    echo Error: Executable not found: %EXE_PATH%
    exit /b 1
)

echo Running executable: %EXE_PATH%
call "%EXE_PATH%"

echo.
echo Build and execution completed successfully!
endlocal
