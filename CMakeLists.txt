cmake_minimum_required(VERSION 2.8 FATAL_ERROR)

include(CheckCXXCompilerFlag)
CHECK_CXX_COMPILER_FLAG("-std=c++11" COMPILER_SUPPORTS_CXX11)
CHECK_CXX_COMPILER_FLAG("-std=c++0x" COMPILER_SUPPORTS_CXX0X)
if(COMPILER_SUPPORTS_CXX11)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
elseif(COMPILER_SUPPORTS_CXX0X)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++0x")
else()
        message(STATUS "The compiler ${CMAKE_CXX_COMPILER} has no C++11 support. Please use a different C++ compiler.")
endif()

add_executable(Complex Complex.h ComplexParamAbs_test.cpp ComplexFixture_test.cpp Complex.cpp)

#Directorios gmock y gtest
set(GMOCK_DIR /usr/src/gtest/googlemock)
set(GTEST_DIR /usr/src/gtest/googletest)

include_directories(SYSTEM ${GMOCK_DIR}/gtest/include
                           ${GMOCK_DIR}/include
                           ${GTEST_DIR}/include)
#Librerias utilizadas
target_link_libraries(Complex gmock_main gmock gtest pthread)
