execute_process(COMMAND "/home/axel/P5/build/geometry2/tf2_ros/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/axel/P5/build/geometry2/tf2_ros/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
