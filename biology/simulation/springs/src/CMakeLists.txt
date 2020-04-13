
add_executable(nyion main.cpp)
target_link_libraries(nyion ${MATHGL2_LIBRARY} ${OPENGL_LIBRARIES} ${GLUT_LIBRARY} ${CUDA_LIBRARIES} nyion_lib gtest gtest_main visualize common OpenMP::OpenMP_CXX )

add_executable(array_helper array_helper_program/array_helper.cpp)
target_link_libraries(array_helper ${MATHGL2_LIBRARY} ${OPENGL_LIBRARIES} ${GLUT_LIBRARY} ${CUDA_LIBRARIES} OpenMP::OpenMP_CXX )
target_link_libraries(array_helper nyion_lib physics_mesh state_persist visualize common)
