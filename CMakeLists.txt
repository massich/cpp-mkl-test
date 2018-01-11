cmake_minimum_required (VERSION 3.2)
project (CMakeHelloWorld)

#version number
set (CMakeHelloWorld_VERSION_MAJOR 1)
set (CMakeHelloWorld_VERSION_MINOR 0)

# Find the BLAS stuff
set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake ${CMAKE_MODULE_PATH})
find_package(BLAS2 REQUIRED)

message(STATUS "BLAS Libraries: ${BLAS_LIBRARIES}")

# find_path(BLAS_INCLUDE_DIRS NAMES cblas.h)
# message(STATUS "BLAS Include: ${BLAS_INCLUDE_DIRS}")
# include_directories(${BLAS_INCLUDE_DIRS})

set(BLA_DEFINITIONS)
if (BLA_VENDOR MATCHES Intel)
    if ("$ENV{MKLROOT}" STREQUAL "")
        message(FATAL_ERROR "MKLROOT is not set. Please source the Intel MKL mklvars.sh file.")
    endif()
    find_path(MKL_INCLUDE_DIRS NAMES mkl.h
              PATHS $ENV{MKLROOT}/include/)
    message(STATUS "MKL Include: ${MKL_INCLUDE_DIRS}")
    include_directories(${MKL_INCLUDE_DIRS})
    set(BLA_DEFINITIONS USE_MKL)
elseif (BLA_VENDOR MATCHES ATLAS)
    find_library(CBLAS_LIB NAMES cblas)
    set(BLAS_LIBRARIES "${BLAS_LIBRARIES};${CBLAS_LIB}")
endif()

# include_directories(SYSTEM
#   C:\\nuget_openblas\\OpenBLAS.0.2.14.1\\lib\\native\\include\\
#   C:\\OpenBLAS.0.2.14.1\\lib\\native\\include\\)

#include the subdirectory containing our libs
add_subdirectory(Hello)
include_directories(Hello)
#indicate the entry point for the executable
add_executable(CMakeHelloWorld Hello HelloWorld.cpp)

# Indicate which libraries to include during the link process.
target_link_libraries(CMakeHelloWorld Hello ${BLAS_LIBRARIES})

# install (TARGETS CMakeHelloWorld DESTINATION bin)
