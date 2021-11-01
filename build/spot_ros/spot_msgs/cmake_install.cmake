# Install script for directory: /home/axel/P5/src/spot_ros/spot_msgs

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/axel/P5/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/spot_msgs/msg" TYPE FILE FILES
    "/home/axel/P5/src/spot_ros/spot_msgs/msg/BatteryStateArray.msg"
    "/home/axel/P5/src/spot_ros/spot_msgs/msg/BehaviorFault.msg"
    "/home/axel/P5/src/spot_ros/spot_msgs/msg/EStopStateArray.msg"
    "/home/axel/P5/src/spot_ros/spot_msgs/msg/FootStateArray.msg"
    "/home/axel/P5/src/spot_ros/spot_msgs/msg/LeaseArray.msg"
    "/home/axel/P5/src/spot_ros/spot_msgs/msg/LeaseOwner.msg"
    "/home/axel/P5/src/spot_ros/spot_msgs/msg/Metrics.msg"
    "/home/axel/P5/src/spot_ros/spot_msgs/msg/MobilityParams.msg"
    "/home/axel/P5/src/spot_ros/spot_msgs/msg/SystemFault.msg"
    "/home/axel/P5/src/spot_ros/spot_msgs/msg/WiFiState.msg"
    "/home/axel/P5/src/spot_ros/spot_msgs/msg/BatteryState.msg"
    "/home/axel/P5/src/spot_ros/spot_msgs/msg/BehaviorFaultState.msg"
    "/home/axel/P5/src/spot_ros/spot_msgs/msg/EStopState.msg"
    "/home/axel/P5/src/spot_ros/spot_msgs/msg/Feedback.msg"
    "/home/axel/P5/src/spot_ros/spot_msgs/msg/FootState.msg"
    "/home/axel/P5/src/spot_ros/spot_msgs/msg/Lease.msg"
    "/home/axel/P5/src/spot_ros/spot_msgs/msg/LeaseResource.msg"
    "/home/axel/P5/src/spot_ros/spot_msgs/msg/PowerState.msg"
    "/home/axel/P5/src/spot_ros/spot_msgs/msg/SystemFaultState.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/spot_msgs/srv" TYPE FILE FILES
    "/home/axel/P5/src/spot_ros/spot_msgs/srv/ListGraph.srv"
    "/home/axel/P5/src/spot_ros/spot_msgs/srv/SetLocomotion.srv"
    "/home/axel/P5/src/spot_ros/spot_msgs/srv/SetVelocity.srv"
    "/home/axel/P5/src/spot_ros/spot_msgs/srv/ClearBehaviorFault.srv"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/spot_msgs/action" TYPE FILE FILES
    "/home/axel/P5/src/spot_ros/spot_msgs/action/NavigateTo.action"
    "/home/axel/P5/src/spot_ros/spot_msgs/action/Trajectory.action"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/spot_msgs/msg" TYPE FILE FILES
    "/home/axel/P5/devel/share/spot_msgs/msg/NavigateToAction.msg"
    "/home/axel/P5/devel/share/spot_msgs/msg/NavigateToActionGoal.msg"
    "/home/axel/P5/devel/share/spot_msgs/msg/NavigateToActionResult.msg"
    "/home/axel/P5/devel/share/spot_msgs/msg/NavigateToActionFeedback.msg"
    "/home/axel/P5/devel/share/spot_msgs/msg/NavigateToGoal.msg"
    "/home/axel/P5/devel/share/spot_msgs/msg/NavigateToResult.msg"
    "/home/axel/P5/devel/share/spot_msgs/msg/NavigateToFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/spot_msgs/msg" TYPE FILE FILES
    "/home/axel/P5/devel/share/spot_msgs/msg/TrajectoryAction.msg"
    "/home/axel/P5/devel/share/spot_msgs/msg/TrajectoryActionGoal.msg"
    "/home/axel/P5/devel/share/spot_msgs/msg/TrajectoryActionResult.msg"
    "/home/axel/P5/devel/share/spot_msgs/msg/TrajectoryActionFeedback.msg"
    "/home/axel/P5/devel/share/spot_msgs/msg/TrajectoryGoal.msg"
    "/home/axel/P5/devel/share/spot_msgs/msg/TrajectoryResult.msg"
    "/home/axel/P5/devel/share/spot_msgs/msg/TrajectoryFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/spot_msgs/cmake" TYPE FILE FILES "/home/axel/P5/build/spot_ros/spot_msgs/catkin_generated/installspace/spot_msgs-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/axel/P5/devel/include/spot_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/axel/P5/devel/share/roseus/ros/spot_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/axel/P5/devel/share/common-lisp/ros/spot_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/axel/P5/devel/share/gennodejs/ros/spot_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
<<<<<<< HEAD
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/vini/P5/devel/lib/python3/dist-packages/spot_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/vini/P5/devel/lib/python3/dist-packages/spot_msgs")
=======
  execute_process(COMMAND "/usr/bin/python2" -m compileall "/home/axel/P5/devel/lib/python2.7/dist-packages/spot_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/axel/P5/devel/lib/python2.7/dist-packages/spot_msgs")
>>>>>>> c0686da4ef00f543f3e2534c55792ba20b859868
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/axel/P5/build/spot_ros/spot_msgs/catkin_generated/installspace/spot_msgs.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/spot_msgs/cmake" TYPE FILE FILES "/home/axel/P5/build/spot_ros/spot_msgs/catkin_generated/installspace/spot_msgs-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/spot_msgs/cmake" TYPE FILE FILES
    "/home/axel/P5/build/spot_ros/spot_msgs/catkin_generated/installspace/spot_msgsConfig.cmake"
    "/home/axel/P5/build/spot_ros/spot_msgs/catkin_generated/installspace/spot_msgsConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/spot_msgs" TYPE FILE FILES "/home/axel/P5/src/spot_ros/spot_msgs/package.xml")
endif()

