include_directories(../src/)
link_directories(../src/)

include_directories(./ ${OpenMM_INCLUDE_DIR})

add_executable (sim_test sim_test.cpp)
target_link_libraries(sim_test helpers ${OpenMM_LIBRARIES} ${MATHGL2_LIBRARY})

target_link_libraries(sim_test gtest gtest_main )

add_test (NAME test COMMAND sim_test)
