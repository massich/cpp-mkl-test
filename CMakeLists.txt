cmake_minimum_required (VERSION 3.2)
project (CMakeHelloWorld)

#version number
set (CMakeHelloWorld_VERSION_MAJOR 1)
set (CMakeHelloWorld_VERSION_MINOR 0)

# Find the BLAS stuff
find_package(BLAS REQUIRED)

message(STATUS "BLAS Libraries: ${BLAS_LIBRARIES}")

# find_path(BLAS_INCLUDE_DIRS NAMES cblas.h)
# message(STATUS "BLAS Include: ${BLAS_INCLUDE_DIRS}")
# include_directories(${BLAS_INCLUDE_DIRS})

set(BLA_DEFINITIONS)

CHECK_INCLUDE_FILE(HAS_MKL "mkl_cblas.h")

if (HAS_MKL)
    if ("$ENV{MKLROOT}" STREQUAL "")
        message(INFO "MKLROOT is not set. Please source the Intel MKL mklvars.sh file.")
    else()
        find_path(MKL_INCLUDE_DIRS NAMES mkl.h
                  PATHS $ENV{MKLROOT}/include/)
        message(STATUS "MKL Include: ${MKL_INCLUDE_DIRS}")
        include_directories(${MKL_INCLUDE_DIRS})
    endif()
    set(BLA_DEFINITIONS USE_MKL)
elseif (BLA_VENDOR MATCHES ATLAS)
    find_library(CBLAS_LIB NAMES cblas)
    set(BLAS_LIBRARIES "${BLAS_LIBRARIES};${CBLAS_LIB}")
endif()

# include_directories(SYSTEM
#   C:\\nuget_openblas\\OpenBLAS.0.2.14.1\\lib\\native\\include\\
#   C:\\OpenBLAS.0.2.14.1\\lib\\native\\include\\)

#include the subdirectory containing our libs
include_directories(Hello)
add_subdirectory(Hello)
#indicate the entry point for the executable
add_executable(CMakeHelloWorld Hello HelloWorld.cpp)

# Indicate which libraries to include during the link process.
target_link_libraries(CMakeHelloWorld Hello ${BLAS_LIBRARIES})

# install (TARGETS CMakeHelloWorld DESTINATION bin)
