include_directories(./ ${OpenMM_INCLUDE_DIR})


add_executable(sim sim.cpp)
target_link_libraries(sim libpdb++ ${MATHGL2_LIBRARY} ${OpenMM_LIBRARIES}  gtest gtest_main OpenMP::OpenMP_CXX)
