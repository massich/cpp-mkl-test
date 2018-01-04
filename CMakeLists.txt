cmake_minimum_required (VERSION 3.2)

project (CMakeHelloWorld)

#version number
set (CMakeHelloWorld_VERSION_MAJOR 1)
set (CMakeHelloWorld_VERSION_MINOR 0)

# Find the BLAS stuff
find_package(BLAS REQUIRED)
find_path(BLAS_INCLUDE_DIRS NAMES cblas.h)

message(STATUS "BLAS Include: ${BLAS_INCLUDE_DIRS}")
message(STATUS "BLAS Libraries: ${BLAS_LIBRARIES}")

include_directories(${BLAS_INCLUDE_DIRS})

#include the subdirectory containing our libs
add_subdirectory (Hello)
include_directories(Hello)
#indicate the entry point for the executable
add_executable (CMakeHelloWorld Hello HelloWorld.cpp)

# Indicate which libraries to include during the link process.
target_link_libraries (CMakeHelloWorld Hello ${BLAS_LIBRARIES})

# install (TARGETS CMakeHelloWorld DESTINATION bin)
