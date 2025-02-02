cmake_minimum_required(VERSION 3.10)
project(NextGen)

# Set the C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Include directories
include_directories(${CMAKE_SOURCE_DIR}/Tools)
include_directories(${CMAKE_SOURCE_DIR}/Cfg)

# Compile additional source files into a library
add_library(NextGenLib ${CMAKE_SOURCE_DIR}/Tools/common.c)

# Link the library to the main executable
add_executable(NextGen main.c)
target_link_libraries(NextGen PRIVATE NextGenLib)
