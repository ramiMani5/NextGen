@echo off
setlocal

REM Optional: Clean the previous build
if exist ..\build (
    echo Removing previous build directory...
    rmdir /s /q ..\build
)

echo Creating build directory...
mkdir ..\build 2>nul
cd ..\build || exit /b

echo Running CMake...
cmake -G "MinGW Makefiles" ..\Software\

echo Building the project...
cmake --build .

REM Extract project name from CMakeLists.txt
set "PROJECT_NAME="
for /f "tokens=1,* delims=()" %%A in ('findstr /i /r "^project(" ..\Software\CMakeLists.txt') do (
    set "PROJECT_NAME=%%B"
    goto :GotProjectName
)

:GotProjectName
if "%PROJECT_NAME%"=="" (
    echo Error: Could not determine project name from CMakeLists.txt
    exit /b 1
)

echo Running the executable...
call "%cd%\%PROJECT_NAME%.exe"

echo Done!
endlocal
