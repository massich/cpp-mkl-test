cmake_minimum_required (VERSION 3.2)
project (CMakeHelloWorld)

#version number
set (CMakeHelloWorld_VERSION_MAJOR 1)
set (CMakeHelloWorld_VERSION_MINOR 0)

# Find the BLAS stuff
# find_package(BLAS REQUIRED)

# For the CI's set CMAKE_CURRENT_LIST_DIR_xxx manually from the cmake call
# otherwise set as local default
if (NOT EXISTS "${CMAKE_CURRENT_LIST_DIR_xxx}")
  set( CMAKE_CURRENT_LIST_DIR_xxx "/usr/local/share/cmake-3.8/Modules/" )
endif()

include(my_FindBLAS.cmake)
message(STATUS "BLAS LIB: ${BLAS_LIBRARIES}")

#include the subdirectory containing our libs
add_subdirectory (Hello)
include_directories(Hello)
#indicate the entry point for the executable
add_executable (CMakeHelloWorld Hello HelloWorld.cpp)

# Indicate which libraries to include during the link process.
target_link_libraries (CMakeHelloWorld Hello ${BLAS_LIBRARIES})

# install (TARGETS CMakeHelloWorld DESTINATION bin)
