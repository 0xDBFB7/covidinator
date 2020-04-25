include_directories(./ ${OpenMM_INCLUDE_DIR})


add_library(helpers helpers.cpp)
target_link_libraries(helpers libpdb++ ${MATHGL2_LIBRARY} ${OpenMM_LIBRARIES}  gtest gtest_main OpenMP::OpenMP_CXX)


add_library(sim sim.cpp)
target_link_libraries(sim helpers libpdb++ ${MATHGL2_LIBRARY} ${OpenMM_LIBRARIES}  gtest gtest_main OpenMP::OpenMP_CXX)


add_executable(main main.cpp)
target_link_libraries(main helpers sim libpdb++ ${MATHGL2_LIBRARY} ${OpenMM_LIBRARIES}  gtest gtest_main OpenMP::OpenMP_CXX)
