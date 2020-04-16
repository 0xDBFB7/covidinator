include_directories(./)


add_library(james_lib james.cpp)
target_link_libraries(james_lib ${MATHGL2_LIBRARY} gtest gtest_main OpenMP::OpenMP_CXX libpdb++)

add_executable(james main.cpp)
target_link_libraries(james james_lib)
