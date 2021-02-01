project(your_project_name)
cmake_minimum_required(VERSION 2.8.12)

add_compile_options(-std=c++11 -Wall -O3 -fopenmp -lhdf5 -I/usr/include/hdf5/serial)  # modify flags appropriately for your project
# add_compile_definitions(NDEBUG)  # disable asserts

find_package(HDF5 REQUIRED)


add_subdirectory(/home/arthurdent/Programs/medusa medusa) # add our library's CMakeLists.txt as a subfolder
include_directories(/home/arthurdent/Programs/medusa/include)  # include medusa headers directory

# define your own executables below
add_executable(medusa_test medusa_test.cpp)
target_link_libraries(medusa_test medusa)  # link to our library
