
add_executable(james james.cpp)
target_link_libraries(james ${MATHGL2_LIBRARY} gtest gtest_main OpenMP::OpenMP_CXX )
