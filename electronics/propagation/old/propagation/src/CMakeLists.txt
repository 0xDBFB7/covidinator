include_directories(./)


add_library(propagation_lib propagation.cpp)
target_link_libraries(propagation_lib ${MATHGL2_LIBRARY} gtest gtest_main OpenMP::OpenMP_CXX)

add_executable(propagation main.cpp)
target_link_libraries(propagation propagation_lib)
