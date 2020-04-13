include_directories(../src/)
link_directories(../src/)

add_executable (james_test james_test.cpp)
target_link_libraries(james_test ${MATHGL2_LIBRARY} ${CUDA_LIBRARIES})

target_link_libraries(james_test state_persist)

target_link_libraries(james_test gtest gtest_main )

add_test (NAME test COMMAND james_test)
