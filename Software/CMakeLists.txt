cmake_minimum_required(VERSION 3.10)
project(NextGen)

# Set the C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Add the flag to save preprocessed files (.i)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -save-temps")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -save-temps")

# Include directories
include_directories(${CMAKE_SOURCE_DIR}/Tools)
include_directories(${CMAKE_SOURCE_DIR}/Cfg)

# Dynamically find all .c files in Software/Tools/
file(GLOB TOOLS_SOURCES "${CMAKE_SOURCE_DIR}/Tools/*.c")

# Create a library from all found .c files
add_library(ToolsLib ${TOOLS_SOURCES})

# Link the library to the main executable
add_executable(NextGen main.c)
target_link_libraries(NextGen PRIVATE ToolsLib)
