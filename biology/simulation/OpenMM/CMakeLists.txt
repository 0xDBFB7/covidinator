cmake_minimum_required(VERSION 3.16)

set (CMAKE_CXX_STANDARD 17)

#set(CXX_ASAN_FLAGS "-fno-omit-frame-pointer -fsanitize=address -fsanitize=undefined -fsanitize=leak -no-pie -pg -g -coverage")
set(CXX_ASAN_FLAGS " ")

set(CXX_OPENMM_FLAGS "-Wno-error=reorder -Wno-error=unused-function -Wno-reorder -Wno-unused-function")

set(CXX_LIBPDB_FLAGS "-Wno-error=switch -Wno-switch")

set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -pedantic -Werror -fopenmp -Wno-unused-parameter ${CXX_ASAN_FLAGS} ${CXX_LIBPDB_FLAGS} ${CXX_OPENMM_FLAGS} -O2 ")


#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/arthurdent/Programs/gcc-offload/gcc-offload/install/lib64/
#export CPATH=$CPATH:/usr/local/cuda/include
#export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/cuda/lib64
#~/Programs/gcc-offload/gcc-offload/install/bin/g++ -Wall -Werror -fsanitize=undefined,null -fopenmp -foffload=-lm -fno-fast-math -fno-associative-math openmp_offload.cpp -o ompfl && ./ompfl
#-foffload=-lm -fno-fast-math -fno-associative-math required for math function offload


#set(CMAKE_CXX_COMPILER "/home/arthurdent/Programs/gcc-offload/gcc-offload/install/bin/g++")


set (CMAKE_LINKER_FLAGS_DEBUG "${CMAKE_LINKER_FLAGS_DEBUG} ${CXX_ASAN_FLAGS} -g")

PROJECT(sim LANGUAGES CXX C)

set(OpenMM_ROOT_DIR /home/arthurdent/Programs/openmm-7.4.1/openmm-7.4.1/install/)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "~/Projects/covidinator/biology/simulation/OpenMM/") #relative?

find_package(OpenMP REQUIRED)
find_package(OpenMM REQUIRED)
find_package(MathGL2 REQUIRED)

include_directories(${CMAKE_SOURCE_DIR} ${MATHGL2_INCLUDE_DIR} ../src/ )

include_directories(./libpdb++)
add_subdirectory (./libpdb++)

set(CMAKE_BUILD_TYPE Debug)
add_subdirectory (src)

enable_testing ()
add_subdirectory (test)




configure_file(CMakeLists.txt.in googletest-download/CMakeLists.txt)
execute_process(COMMAND ${CMAKE_COMMAND} -G "${CMAKE_GENERATOR}" .
  RESULT_VARIABLE result
  WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/googletest-download )
if(result)
  message(FATAL_ERROR "CMake step for googletest failed: ${result}")
endif()
execute_process(COMMAND ${CMAKE_COMMAND} --build .
  RESULT_VARIABLE result
  WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/googletest-download )
if(result)
  message(FATAL_ERROR "Build step for googletest failed: ${result}")
endif()
add_subdirectory(${CMAKE_CURRENT_BINARY_DIR}/googletest-src
                 ${CMAKE_CURRENT_BINARY_DIR}/googletest-build
                 EXCLUDE_FROM_ALL)
