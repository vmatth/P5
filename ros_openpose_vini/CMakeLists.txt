cmake_minimum_required(VERSION 2.8.3)
project(ros_openpose)

## Compile as C++11, supported in ROS Kinetic and newer
add_definitions(-std=c++11)

## Find catkin macros and libraries
find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
  sensor_msgs
  message_generation
  message_filters
)

## Declare ROS messages
add_message_files(
  FILES
  Pixel.msg
  BodyPart.msg
  Person.msg
  Frame.msg
  BodyPoints.msg
)

generate_messages(
  DEPENDENCIES
  std_msgs
  geometry_msgs
)

# catkin specific configuration
catkin_package(
  INCLUDE_DIRS include
  CATKIN_DEPENDS
  std_msgs
  geometry_msgs
  message_runtime
  sensor_msgs
  message_filters
)

## Build
# Specify additional locations of header files
include_directories(
  include
)

link_directories(
  ${catkin_LIBRARY_DIRS}
)

## Path to Caffe lib i.e., libcaffe.so
## find /home/ravi/tools/openpose -name libcaffe.so
#set(CAFFE_LIB_FOLDER /home/ravi/tools/openpose/build/caffe/lib)
#link_directories(${CAFFE_LIB_FOLDER})

# Declare a C++ executable and
# specify libraries to link a executable target against

