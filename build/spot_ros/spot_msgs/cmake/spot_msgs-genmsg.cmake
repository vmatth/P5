# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "spot_msgs: 33 messages, 4 services")

set(MSG_I_FLAGS "-Ispot_msgs:/home/vini/P5/src/spot_ros/spot_msgs/msg;-Ispot_msgs:/home/vini/P5/devel/share/spot_msgs/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/melodic/share/geometry_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/melodic/share/actionlib_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(spot_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/BatteryStateArray.msg" NAME_WE)
add_custom_target(_spot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "spot_msgs" "/home/vini/P5/src/spot_ros/spot_msgs/msg/BatteryStateArray.msg" "std_msgs/Header:spot_msgs/BatteryState"
)

get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/BehaviorFault.msg" NAME_WE)
add_custom_target(_spot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "spot_msgs" "/home/vini/P5/src/spot_ros/spot_msgs/msg/BehaviorFault.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/EStopStateArray.msg" NAME_WE)
add_custom_target(_spot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "spot_msgs" "/home/vini/P5/src/spot_ros/spot_msgs/msg/EStopStateArray.msg" "std_msgs/Header:spot_msgs/EStopState"
)

get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/FootStateArray.msg" NAME_WE)
add_custom_target(_spot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "spot_msgs" "/home/vini/P5/src/spot_ros/spot_msgs/msg/FootStateArray.msg" "spot_msgs/FootState:geometry_msgs/Point"
)

get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/LeaseArray.msg" NAME_WE)
add_custom_target(_spot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "spot_msgs" "/home/vini/P5/src/spot_ros/spot_msgs/msg/LeaseArray.msg" "spot_msgs/Lease:spot_msgs/LeaseOwner:spot_msgs/LeaseResource"
)

get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/LeaseOwner.msg" NAME_WE)
add_custom_target(_spot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "spot_msgs" "/home/vini/P5/src/spot_ros/spot_msgs/msg/LeaseOwner.msg" ""
)

get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/Metrics.msg" NAME_WE)
add_custom_target(_spot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "spot_msgs" "/home/vini/P5/src/spot_ros/spot_msgs/msg/Metrics.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/MobilityParams.msg" NAME_WE)
add_custom_target(_spot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "spot_msgs" "/home/vini/P5/src/spot_ros/spot_msgs/msg/MobilityParams.msg" "geometry_msgs/Quaternion:geometry_msgs/Pose:geometry_msgs/Point"
)

get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/SystemFault.msg" NAME_WE)
add_custom_target(_spot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "spot_msgs" "/home/vini/P5/src/spot_ros/spot_msgs/msg/SystemFault.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/WiFiState.msg" NAME_WE)
add_custom_target(_spot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "spot_msgs" "/home/vini/P5/src/spot_ros/spot_msgs/msg/WiFiState.msg" ""
)

get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/BatteryState.msg" NAME_WE)
add_custom_target(_spot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "spot_msgs" "/home/vini/P5/src/spot_ros/spot_msgs/msg/BatteryState.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/BehaviorFaultState.msg" NAME_WE)
add_custom_target(_spot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "spot_msgs" "/home/vini/P5/src/spot_ros/spot_msgs/msg/BehaviorFaultState.msg" "std_msgs/Header:spot_msgs/BehaviorFault"
)

get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/EStopState.msg" NAME_WE)
add_custom_target(_spot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "spot_msgs" "/home/vini/P5/src/spot_ros/spot_msgs/msg/EStopState.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/Feedback.msg" NAME_WE)
add_custom_target(_spot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "spot_msgs" "/home/vini/P5/src/spot_ros/spot_msgs/msg/Feedback.msg" ""
)

get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/FootState.msg" NAME_WE)
add_custom_target(_spot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "spot_msgs" "/home/vini/P5/src/spot_ros/spot_msgs/msg/FootState.msg" "geometry_msgs/Point"
)

get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/Lease.msg" NAME_WE)
add_custom_target(_spot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "spot_msgs" "/home/vini/P5/src/spot_ros/spot_msgs/msg/Lease.msg" ""
)

get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/LeaseResource.msg" NAME_WE)
add_custom_target(_spot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "spot_msgs" "/home/vini/P5/src/spot_ros/spot_msgs/msg/LeaseResource.msg" "spot_msgs/Lease:spot_msgs/LeaseOwner"
)

get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/PowerState.msg" NAME_WE)
add_custom_target(_spot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "spot_msgs" "/home/vini/P5/src/spot_ros/spot_msgs/msg/PowerState.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/SystemFaultState.msg" NAME_WE)
add_custom_target(_spot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "spot_msgs" "/home/vini/P5/src/spot_ros/spot_msgs/msg/SystemFaultState.msg" "std_msgs/Header:spot_msgs/SystemFault"
)

get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToAction.msg" NAME_WE)
add_custom_target(_spot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "spot_msgs" "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToAction.msg" "std_msgs/Header:actionlib_msgs/GoalID:spot_msgs/NavigateToResult:spot_msgs/NavigateToActionGoal:spot_msgs/NavigateToGoal:spot_msgs/NavigateToFeedback:spot_msgs/NavigateToActionResult:actionlib_msgs/GoalStatus:spot_msgs/NavigateToActionFeedback"
)

get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToActionGoal.msg" NAME_WE)
add_custom_target(_spot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "spot_msgs" "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToActionGoal.msg" "std_msgs/Header:actionlib_msgs/GoalID:spot_msgs/NavigateToGoal"
)

get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToActionResult.msg" NAME_WE)
add_custom_target(_spot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "spot_msgs" "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToActionResult.msg" "std_msgs/Header:actionlib_msgs/GoalID:actionlib_msgs/GoalStatus:spot_msgs/NavigateToResult"
)

get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToActionFeedback.msg" NAME_WE)
add_custom_target(_spot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "spot_msgs" "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToActionFeedback.msg" "std_msgs/Header:spot_msgs/NavigateToFeedback:actionlib_msgs/GoalID:actionlib_msgs/GoalStatus"
)

get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToGoal.msg" NAME_WE)
add_custom_target(_spot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "spot_msgs" "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToGoal.msg" ""
)

get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToResult.msg" NAME_WE)
add_custom_target(_spot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "spot_msgs" "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToResult.msg" ""
)

get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToFeedback.msg" NAME_WE)
add_custom_target(_spot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "spot_msgs" "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToFeedback.msg" ""
)

get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryAction.msg" NAME_WE)
add_custom_target(_spot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "spot_msgs" "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryAction.msg" "spot_msgs/TrajectoryActionResult:geometry_msgs/Pose:std_msgs/Header:geometry_msgs/Quaternion:actionlib_msgs/GoalID:spot_msgs/TrajectoryActionFeedback:geometry_msgs/PoseStamped:spot_msgs/TrajectoryGoal:spot_msgs/TrajectoryFeedback:actionlib_msgs/GoalStatus:geometry_msgs/Point:spot_msgs/TrajectoryResult:std_msgs/Duration:spot_msgs/TrajectoryActionGoal"
)

get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryActionGoal.msg" NAME_WE)
add_custom_target(_spot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "spot_msgs" "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryActionGoal.msg" "geometry_msgs/Pose:std_msgs/Header:actionlib_msgs/GoalID:geometry_msgs/PoseStamped:spot_msgs/TrajectoryGoal:geometry_msgs/Point:std_msgs/Duration:geometry_msgs/Quaternion"
)

get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryActionResult.msg" NAME_WE)
add_custom_target(_spot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "spot_msgs" "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryActionResult.msg" "std_msgs/Header:actionlib_msgs/GoalID:actionlib_msgs/GoalStatus:spot_msgs/TrajectoryResult"
)

get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryActionFeedback.msg" NAME_WE)
add_custom_target(_spot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "spot_msgs" "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryActionFeedback.msg" "std_msgs/Header:actionlib_msgs/GoalID:actionlib_msgs/GoalStatus:spot_msgs/TrajectoryFeedback"
)

get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryGoal.msg" NAME_WE)
add_custom_target(_spot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "spot_msgs" "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryGoal.msg" "geometry_msgs/Pose:std_msgs/Header:geometry_msgs/PoseStamped:geometry_msgs/Point:std_msgs/Duration:geometry_msgs/Quaternion"
)

get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryResult.msg" NAME_WE)
add_custom_target(_spot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "spot_msgs" "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryResult.msg" ""
)

get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryFeedback.msg" NAME_WE)
add_custom_target(_spot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "spot_msgs" "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryFeedback.msg" ""
)

get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/srv/ListGraph.srv" NAME_WE)
add_custom_target(_spot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "spot_msgs" "/home/vini/P5/src/spot_ros/spot_msgs/srv/ListGraph.srv" ""
)

get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/srv/SetLocomotion.srv" NAME_WE)
add_custom_target(_spot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "spot_msgs" "/home/vini/P5/src/spot_ros/spot_msgs/srv/SetLocomotion.srv" ""
)

get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/srv/SetVelocity.srv" NAME_WE)
add_custom_target(_spot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "spot_msgs" "/home/vini/P5/src/spot_ros/spot_msgs/srv/SetVelocity.srv" "geometry_msgs/Twist:geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/srv/ClearBehaviorFault.srv" NAME_WE)
add_custom_target(_spot_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "spot_msgs" "/home/vini/P5/src/spot_ros/spot_msgs/srv/ClearBehaviorFault.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/BatteryStateArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/vini/P5/src/spot_ros/spot_msgs/msg/BatteryState.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/spot_msgs
)
_generate_msg_cpp(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/BehaviorFault.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/spot_msgs
)
_generate_msg_cpp(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/EStopStateArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/vini/P5/src/spot_ros/spot_msgs/msg/EStopState.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/spot_msgs
)
_generate_msg_cpp(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/FootStateArray.msg"
  "${MSG_I_FLAGS}"
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/FootState.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/spot_msgs
)
_generate_msg_cpp(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/LeaseArray.msg"
  "${MSG_I_FLAGS}"
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/Lease.msg;/home/vini/P5/src/spot_ros/spot_msgs/msg/LeaseOwner.msg;/home/vini/P5/src/spot_ros/spot_msgs/msg/LeaseResource.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/spot_msgs
)
_generate_msg_cpp(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/LeaseOwner.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/spot_msgs
)
_generate_msg_cpp(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/Metrics.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/spot_msgs
)
_generate_msg_cpp(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/MobilityParams.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/spot_msgs
)
_generate_msg_cpp(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/SystemFault.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/spot_msgs
)
_generate_msg_cpp(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/WiFiState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/spot_msgs
)
_generate_msg_cpp(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/BatteryState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/spot_msgs
)
_generate_msg_cpp(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/BehaviorFaultState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/vini/P5/src/spot_ros/spot_msgs/msg/BehaviorFault.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/spot_msgs
)
_generate_msg_cpp(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/EStopState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/spot_msgs
)
_generate_msg_cpp(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/Feedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/spot_msgs
)
_generate_msg_cpp(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/FootState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/spot_msgs
)
_generate_msg_cpp(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/Lease.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/spot_msgs
)
_generate_msg_cpp(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/LeaseResource.msg"
  "${MSG_I_FLAGS}"
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/Lease.msg;/home/vini/P5/src/spot_ros/spot_msgs/msg/LeaseOwner.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/spot_msgs
)
_generate_msg_cpp(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/PowerState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/spot_msgs
)
_generate_msg_cpp(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/SystemFaultState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/vini/P5/src/spot_ros/spot_msgs/msg/SystemFault.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/spot_msgs
)
_generate_msg_cpp(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/vini/P5/devel/share/spot_msgs/msg/NavigateToResult.msg;/home/vini/P5/devel/share/spot_msgs/msg/NavigateToActionGoal.msg;/home/vini/P5/devel/share/spot_msgs/msg/NavigateToGoal.msg;/home/vini/P5/devel/share/spot_msgs/msg/NavigateToFeedback.msg;/home/vini/P5/devel/share/spot_msgs/msg/NavigateToActionResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/vini/P5/devel/share/spot_msgs/msg/NavigateToActionFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/spot_msgs
)
_generate_msg_cpp(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/vini/P5/devel/share/spot_msgs/msg/NavigateToGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/spot_msgs
)
_generate_msg_cpp(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/vini/P5/devel/share/spot_msgs/msg/NavigateToResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/spot_msgs
)
_generate_msg_cpp(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/vini/P5/devel/share/spot_msgs/msg/NavigateToFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/spot_msgs
)
_generate_msg_cpp(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/spot_msgs
)
_generate_msg_cpp(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/spot_msgs
)
_generate_msg_cpp(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/spot_msgs
)
_generate_msg_cpp(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryAction.msg"
  "${MSG_I_FLAGS}"
  "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryActionResult.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryActionFeedback.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryGoal.msg;/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Duration.msg;/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryActionGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/spot_msgs
)
_generate_msg_cpp(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryGoal.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Duration.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/spot_msgs
)
_generate_msg_cpp(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/spot_msgs
)
_generate_msg_cpp(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/spot_msgs
)
_generate_msg_cpp(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Duration.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/spot_msgs
)
_generate_msg_cpp(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/spot_msgs
)
_generate_msg_cpp(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/spot_msgs
)

### Generating Services
_generate_srv_cpp(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/srv/ListGraph.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/spot_msgs
)
_generate_srv_cpp(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/srv/SetLocomotion.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/spot_msgs
)
_generate_srv_cpp(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/srv/SetVelocity.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/spot_msgs
)
_generate_srv_cpp(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/srv/ClearBehaviorFault.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/spot_msgs
)

### Generating Module File
_generate_module_cpp(spot_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/spot_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(spot_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(spot_msgs_generate_messages spot_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/BatteryStateArray.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_cpp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/BehaviorFault.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_cpp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/EStopStateArray.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_cpp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/FootStateArray.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_cpp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/LeaseArray.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_cpp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/LeaseOwner.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_cpp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/Metrics.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_cpp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/MobilityParams.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_cpp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/SystemFault.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_cpp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/WiFiState.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_cpp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/BatteryState.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_cpp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/BehaviorFaultState.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_cpp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/EStopState.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_cpp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/Feedback.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_cpp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/FootState.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_cpp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/Lease.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_cpp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/LeaseResource.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_cpp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/PowerState.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_cpp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/SystemFaultState.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_cpp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToAction.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_cpp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToActionGoal.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_cpp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToActionResult.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_cpp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToActionFeedback.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_cpp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToGoal.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_cpp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToResult.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_cpp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToFeedback.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_cpp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryAction.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_cpp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryActionGoal.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_cpp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryActionResult.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_cpp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryActionFeedback.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_cpp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryGoal.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_cpp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryResult.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_cpp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryFeedback.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_cpp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/srv/ListGraph.srv" NAME_WE)
add_dependencies(spot_msgs_generate_messages_cpp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/srv/SetLocomotion.srv" NAME_WE)
add_dependencies(spot_msgs_generate_messages_cpp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/srv/SetVelocity.srv" NAME_WE)
add_dependencies(spot_msgs_generate_messages_cpp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/srv/ClearBehaviorFault.srv" NAME_WE)
add_dependencies(spot_msgs_generate_messages_cpp _spot_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(spot_msgs_gencpp)
add_dependencies(spot_msgs_gencpp spot_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS spot_msgs_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/BatteryStateArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/vini/P5/src/spot_ros/spot_msgs/msg/BatteryState.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/spot_msgs
)
_generate_msg_eus(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/BehaviorFault.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/spot_msgs
)
_generate_msg_eus(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/EStopStateArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/vini/P5/src/spot_ros/spot_msgs/msg/EStopState.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/spot_msgs
)
_generate_msg_eus(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/FootStateArray.msg"
  "${MSG_I_FLAGS}"
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/FootState.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/spot_msgs
)
_generate_msg_eus(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/LeaseArray.msg"
  "${MSG_I_FLAGS}"
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/Lease.msg;/home/vini/P5/src/spot_ros/spot_msgs/msg/LeaseOwner.msg;/home/vini/P5/src/spot_ros/spot_msgs/msg/LeaseResource.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/spot_msgs
)
_generate_msg_eus(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/LeaseOwner.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/spot_msgs
)
_generate_msg_eus(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/Metrics.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/spot_msgs
)
_generate_msg_eus(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/MobilityParams.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/spot_msgs
)
_generate_msg_eus(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/SystemFault.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/spot_msgs
)
_generate_msg_eus(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/WiFiState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/spot_msgs
)
_generate_msg_eus(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/BatteryState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/spot_msgs
)
_generate_msg_eus(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/BehaviorFaultState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/vini/P5/src/spot_ros/spot_msgs/msg/BehaviorFault.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/spot_msgs
)
_generate_msg_eus(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/EStopState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/spot_msgs
)
_generate_msg_eus(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/Feedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/spot_msgs
)
_generate_msg_eus(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/FootState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/spot_msgs
)
_generate_msg_eus(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/Lease.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/spot_msgs
)
_generate_msg_eus(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/LeaseResource.msg"
  "${MSG_I_FLAGS}"
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/Lease.msg;/home/vini/P5/src/spot_ros/spot_msgs/msg/LeaseOwner.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/spot_msgs
)
_generate_msg_eus(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/PowerState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/spot_msgs
)
_generate_msg_eus(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/SystemFaultState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/vini/P5/src/spot_ros/spot_msgs/msg/SystemFault.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/spot_msgs
)
_generate_msg_eus(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/vini/P5/devel/share/spot_msgs/msg/NavigateToResult.msg;/home/vini/P5/devel/share/spot_msgs/msg/NavigateToActionGoal.msg;/home/vini/P5/devel/share/spot_msgs/msg/NavigateToGoal.msg;/home/vini/P5/devel/share/spot_msgs/msg/NavigateToFeedback.msg;/home/vini/P5/devel/share/spot_msgs/msg/NavigateToActionResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/vini/P5/devel/share/spot_msgs/msg/NavigateToActionFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/spot_msgs
)
_generate_msg_eus(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/vini/P5/devel/share/spot_msgs/msg/NavigateToGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/spot_msgs
)
_generate_msg_eus(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/vini/P5/devel/share/spot_msgs/msg/NavigateToResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/spot_msgs
)
_generate_msg_eus(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/vini/P5/devel/share/spot_msgs/msg/NavigateToFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/spot_msgs
)
_generate_msg_eus(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/spot_msgs
)
_generate_msg_eus(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/spot_msgs
)
_generate_msg_eus(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/spot_msgs
)
_generate_msg_eus(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryAction.msg"
  "${MSG_I_FLAGS}"
  "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryActionResult.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryActionFeedback.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryGoal.msg;/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Duration.msg;/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryActionGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/spot_msgs
)
_generate_msg_eus(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryGoal.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Duration.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/spot_msgs
)
_generate_msg_eus(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/spot_msgs
)
_generate_msg_eus(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/spot_msgs
)
_generate_msg_eus(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Duration.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/spot_msgs
)
_generate_msg_eus(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/spot_msgs
)
_generate_msg_eus(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/spot_msgs
)

### Generating Services
_generate_srv_eus(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/srv/ListGraph.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/spot_msgs
)
_generate_srv_eus(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/srv/SetLocomotion.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/spot_msgs
)
_generate_srv_eus(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/srv/SetVelocity.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/spot_msgs
)
_generate_srv_eus(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/srv/ClearBehaviorFault.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/spot_msgs
)

### Generating Module File
_generate_module_eus(spot_msgs
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/spot_msgs
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(spot_msgs_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(spot_msgs_generate_messages spot_msgs_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/BatteryStateArray.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_eus _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/BehaviorFault.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_eus _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/EStopStateArray.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_eus _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/FootStateArray.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_eus _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/LeaseArray.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_eus _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/LeaseOwner.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_eus _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/Metrics.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_eus _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/MobilityParams.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_eus _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/SystemFault.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_eus _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/WiFiState.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_eus _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/BatteryState.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_eus _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/BehaviorFaultState.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_eus _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/EStopState.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_eus _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/Feedback.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_eus _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/FootState.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_eus _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/Lease.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_eus _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/LeaseResource.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_eus _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/PowerState.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_eus _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/SystemFaultState.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_eus _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToAction.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_eus _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToActionGoal.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_eus _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToActionResult.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_eus _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToActionFeedback.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_eus _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToGoal.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_eus _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToResult.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_eus _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToFeedback.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_eus _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryAction.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_eus _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryActionGoal.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_eus _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryActionResult.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_eus _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryActionFeedback.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_eus _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryGoal.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_eus _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryResult.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_eus _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryFeedback.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_eus _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/srv/ListGraph.srv" NAME_WE)
add_dependencies(spot_msgs_generate_messages_eus _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/srv/SetLocomotion.srv" NAME_WE)
add_dependencies(spot_msgs_generate_messages_eus _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/srv/SetVelocity.srv" NAME_WE)
add_dependencies(spot_msgs_generate_messages_eus _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/srv/ClearBehaviorFault.srv" NAME_WE)
add_dependencies(spot_msgs_generate_messages_eus _spot_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(spot_msgs_geneus)
add_dependencies(spot_msgs_geneus spot_msgs_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS spot_msgs_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/BatteryStateArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/vini/P5/src/spot_ros/spot_msgs/msg/BatteryState.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/spot_msgs
)
_generate_msg_lisp(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/BehaviorFault.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/spot_msgs
)
_generate_msg_lisp(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/EStopStateArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/vini/P5/src/spot_ros/spot_msgs/msg/EStopState.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/spot_msgs
)
_generate_msg_lisp(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/FootStateArray.msg"
  "${MSG_I_FLAGS}"
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/FootState.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/spot_msgs
)
_generate_msg_lisp(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/LeaseArray.msg"
  "${MSG_I_FLAGS}"
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/Lease.msg;/home/vini/P5/src/spot_ros/spot_msgs/msg/LeaseOwner.msg;/home/vini/P5/src/spot_ros/spot_msgs/msg/LeaseResource.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/spot_msgs
)
_generate_msg_lisp(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/LeaseOwner.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/spot_msgs
)
_generate_msg_lisp(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/Metrics.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/spot_msgs
)
_generate_msg_lisp(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/MobilityParams.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/spot_msgs
)
_generate_msg_lisp(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/SystemFault.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/spot_msgs
)
_generate_msg_lisp(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/WiFiState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/spot_msgs
)
_generate_msg_lisp(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/BatteryState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/spot_msgs
)
_generate_msg_lisp(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/BehaviorFaultState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/vini/P5/src/spot_ros/spot_msgs/msg/BehaviorFault.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/spot_msgs
)
_generate_msg_lisp(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/EStopState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/spot_msgs
)
_generate_msg_lisp(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/Feedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/spot_msgs
)
_generate_msg_lisp(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/FootState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/spot_msgs
)
_generate_msg_lisp(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/Lease.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/spot_msgs
)
_generate_msg_lisp(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/LeaseResource.msg"
  "${MSG_I_FLAGS}"
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/Lease.msg;/home/vini/P5/src/spot_ros/spot_msgs/msg/LeaseOwner.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/spot_msgs
)
_generate_msg_lisp(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/PowerState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/spot_msgs
)
_generate_msg_lisp(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/SystemFaultState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/vini/P5/src/spot_ros/spot_msgs/msg/SystemFault.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/spot_msgs
)
_generate_msg_lisp(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/vini/P5/devel/share/spot_msgs/msg/NavigateToResult.msg;/home/vini/P5/devel/share/spot_msgs/msg/NavigateToActionGoal.msg;/home/vini/P5/devel/share/spot_msgs/msg/NavigateToGoal.msg;/home/vini/P5/devel/share/spot_msgs/msg/NavigateToFeedback.msg;/home/vini/P5/devel/share/spot_msgs/msg/NavigateToActionResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/vini/P5/devel/share/spot_msgs/msg/NavigateToActionFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/spot_msgs
)
_generate_msg_lisp(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/vini/P5/devel/share/spot_msgs/msg/NavigateToGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/spot_msgs
)
_generate_msg_lisp(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/vini/P5/devel/share/spot_msgs/msg/NavigateToResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/spot_msgs
)
_generate_msg_lisp(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/vini/P5/devel/share/spot_msgs/msg/NavigateToFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/spot_msgs
)
_generate_msg_lisp(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/spot_msgs
)
_generate_msg_lisp(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/spot_msgs
)
_generate_msg_lisp(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/spot_msgs
)
_generate_msg_lisp(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryAction.msg"
  "${MSG_I_FLAGS}"
  "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryActionResult.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryActionFeedback.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryGoal.msg;/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Duration.msg;/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryActionGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/spot_msgs
)
_generate_msg_lisp(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryGoal.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Duration.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/spot_msgs
)
_generate_msg_lisp(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/spot_msgs
)
_generate_msg_lisp(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/spot_msgs
)
_generate_msg_lisp(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Duration.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/spot_msgs
)
_generate_msg_lisp(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/spot_msgs
)
_generate_msg_lisp(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/spot_msgs
)

### Generating Services
_generate_srv_lisp(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/srv/ListGraph.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/spot_msgs
)
_generate_srv_lisp(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/srv/SetLocomotion.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/spot_msgs
)
_generate_srv_lisp(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/srv/SetVelocity.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/spot_msgs
)
_generate_srv_lisp(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/srv/ClearBehaviorFault.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/spot_msgs
)

### Generating Module File
_generate_module_lisp(spot_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/spot_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(spot_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(spot_msgs_generate_messages spot_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/BatteryStateArray.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_lisp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/BehaviorFault.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_lisp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/EStopStateArray.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_lisp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/FootStateArray.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_lisp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/LeaseArray.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_lisp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/LeaseOwner.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_lisp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/Metrics.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_lisp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/MobilityParams.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_lisp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/SystemFault.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_lisp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/WiFiState.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_lisp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/BatteryState.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_lisp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/BehaviorFaultState.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_lisp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/EStopState.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_lisp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/Feedback.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_lisp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/FootState.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_lisp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/Lease.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_lisp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/LeaseResource.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_lisp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/PowerState.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_lisp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/SystemFaultState.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_lisp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToAction.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_lisp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToActionGoal.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_lisp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToActionResult.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_lisp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToActionFeedback.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_lisp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToGoal.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_lisp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToResult.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_lisp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToFeedback.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_lisp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryAction.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_lisp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryActionGoal.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_lisp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryActionResult.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_lisp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryActionFeedback.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_lisp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryGoal.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_lisp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryResult.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_lisp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryFeedback.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_lisp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/srv/ListGraph.srv" NAME_WE)
add_dependencies(spot_msgs_generate_messages_lisp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/srv/SetLocomotion.srv" NAME_WE)
add_dependencies(spot_msgs_generate_messages_lisp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/srv/SetVelocity.srv" NAME_WE)
add_dependencies(spot_msgs_generate_messages_lisp _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/srv/ClearBehaviorFault.srv" NAME_WE)
add_dependencies(spot_msgs_generate_messages_lisp _spot_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(spot_msgs_genlisp)
add_dependencies(spot_msgs_genlisp spot_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS spot_msgs_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/BatteryStateArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/vini/P5/src/spot_ros/spot_msgs/msg/BatteryState.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/spot_msgs
)
_generate_msg_nodejs(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/BehaviorFault.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/spot_msgs
)
_generate_msg_nodejs(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/EStopStateArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/vini/P5/src/spot_ros/spot_msgs/msg/EStopState.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/spot_msgs
)
_generate_msg_nodejs(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/FootStateArray.msg"
  "${MSG_I_FLAGS}"
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/FootState.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/spot_msgs
)
_generate_msg_nodejs(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/LeaseArray.msg"
  "${MSG_I_FLAGS}"
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/Lease.msg;/home/vini/P5/src/spot_ros/spot_msgs/msg/LeaseOwner.msg;/home/vini/P5/src/spot_ros/spot_msgs/msg/LeaseResource.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/spot_msgs
)
_generate_msg_nodejs(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/LeaseOwner.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/spot_msgs
)
_generate_msg_nodejs(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/Metrics.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/spot_msgs
)
_generate_msg_nodejs(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/MobilityParams.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/spot_msgs
)
_generate_msg_nodejs(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/SystemFault.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/spot_msgs
)
_generate_msg_nodejs(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/WiFiState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/spot_msgs
)
_generate_msg_nodejs(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/BatteryState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/spot_msgs
)
_generate_msg_nodejs(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/BehaviorFaultState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/vini/P5/src/spot_ros/spot_msgs/msg/BehaviorFault.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/spot_msgs
)
_generate_msg_nodejs(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/EStopState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/spot_msgs
)
_generate_msg_nodejs(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/Feedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/spot_msgs
)
_generate_msg_nodejs(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/FootState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/spot_msgs
)
_generate_msg_nodejs(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/Lease.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/spot_msgs
)
_generate_msg_nodejs(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/LeaseResource.msg"
  "${MSG_I_FLAGS}"
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/Lease.msg;/home/vini/P5/src/spot_ros/spot_msgs/msg/LeaseOwner.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/spot_msgs
)
_generate_msg_nodejs(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/PowerState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/spot_msgs
)
_generate_msg_nodejs(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/SystemFaultState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/vini/P5/src/spot_ros/spot_msgs/msg/SystemFault.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/spot_msgs
)
_generate_msg_nodejs(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/vini/P5/devel/share/spot_msgs/msg/NavigateToResult.msg;/home/vini/P5/devel/share/spot_msgs/msg/NavigateToActionGoal.msg;/home/vini/P5/devel/share/spot_msgs/msg/NavigateToGoal.msg;/home/vini/P5/devel/share/spot_msgs/msg/NavigateToFeedback.msg;/home/vini/P5/devel/share/spot_msgs/msg/NavigateToActionResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/vini/P5/devel/share/spot_msgs/msg/NavigateToActionFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/spot_msgs
)
_generate_msg_nodejs(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/vini/P5/devel/share/spot_msgs/msg/NavigateToGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/spot_msgs
)
_generate_msg_nodejs(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/vini/P5/devel/share/spot_msgs/msg/NavigateToResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/spot_msgs
)
_generate_msg_nodejs(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/vini/P5/devel/share/spot_msgs/msg/NavigateToFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/spot_msgs
)
_generate_msg_nodejs(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/spot_msgs
)
_generate_msg_nodejs(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/spot_msgs
)
_generate_msg_nodejs(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/spot_msgs
)
_generate_msg_nodejs(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryAction.msg"
  "${MSG_I_FLAGS}"
  "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryActionResult.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryActionFeedback.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryGoal.msg;/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Duration.msg;/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryActionGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/spot_msgs
)
_generate_msg_nodejs(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryGoal.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Duration.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/spot_msgs
)
_generate_msg_nodejs(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/spot_msgs
)
_generate_msg_nodejs(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/spot_msgs
)
_generate_msg_nodejs(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Duration.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/spot_msgs
)
_generate_msg_nodejs(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/spot_msgs
)
_generate_msg_nodejs(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/spot_msgs
)

### Generating Services
_generate_srv_nodejs(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/srv/ListGraph.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/spot_msgs
)
_generate_srv_nodejs(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/srv/SetLocomotion.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/spot_msgs
)
_generate_srv_nodejs(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/srv/SetVelocity.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/spot_msgs
)
_generate_srv_nodejs(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/srv/ClearBehaviorFault.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/spot_msgs
)

### Generating Module File
_generate_module_nodejs(spot_msgs
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/spot_msgs
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(spot_msgs_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(spot_msgs_generate_messages spot_msgs_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/BatteryStateArray.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_nodejs _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/BehaviorFault.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_nodejs _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/EStopStateArray.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_nodejs _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/FootStateArray.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_nodejs _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/LeaseArray.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_nodejs _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/LeaseOwner.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_nodejs _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/Metrics.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_nodejs _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/MobilityParams.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_nodejs _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/SystemFault.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_nodejs _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/WiFiState.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_nodejs _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/BatteryState.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_nodejs _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/BehaviorFaultState.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_nodejs _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/EStopState.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_nodejs _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/Feedback.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_nodejs _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/FootState.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_nodejs _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/Lease.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_nodejs _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/LeaseResource.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_nodejs _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/PowerState.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_nodejs _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/SystemFaultState.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_nodejs _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToAction.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_nodejs _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToActionGoal.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_nodejs _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToActionResult.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_nodejs _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToActionFeedback.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_nodejs _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToGoal.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_nodejs _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToResult.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_nodejs _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToFeedback.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_nodejs _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryAction.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_nodejs _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryActionGoal.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_nodejs _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryActionResult.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_nodejs _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryActionFeedback.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_nodejs _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryGoal.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_nodejs _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryResult.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_nodejs _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryFeedback.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_nodejs _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/srv/ListGraph.srv" NAME_WE)
add_dependencies(spot_msgs_generate_messages_nodejs _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/srv/SetLocomotion.srv" NAME_WE)
add_dependencies(spot_msgs_generate_messages_nodejs _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/srv/SetVelocity.srv" NAME_WE)
add_dependencies(spot_msgs_generate_messages_nodejs _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/srv/ClearBehaviorFault.srv" NAME_WE)
add_dependencies(spot_msgs_generate_messages_nodejs _spot_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(spot_msgs_gennodejs)
add_dependencies(spot_msgs_gennodejs spot_msgs_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS spot_msgs_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/BatteryStateArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/vini/P5/src/spot_ros/spot_msgs/msg/BatteryState.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/spot_msgs
)
_generate_msg_py(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/BehaviorFault.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/spot_msgs
)
_generate_msg_py(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/EStopStateArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/vini/P5/src/spot_ros/spot_msgs/msg/EStopState.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/spot_msgs
)
_generate_msg_py(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/FootStateArray.msg"
  "${MSG_I_FLAGS}"
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/FootState.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/spot_msgs
)
_generate_msg_py(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/LeaseArray.msg"
  "${MSG_I_FLAGS}"
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/Lease.msg;/home/vini/P5/src/spot_ros/spot_msgs/msg/LeaseOwner.msg;/home/vini/P5/src/spot_ros/spot_msgs/msg/LeaseResource.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/spot_msgs
)
_generate_msg_py(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/LeaseOwner.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/spot_msgs
)
_generate_msg_py(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/Metrics.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/spot_msgs
)
_generate_msg_py(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/MobilityParams.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/spot_msgs
)
_generate_msg_py(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/SystemFault.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/spot_msgs
)
_generate_msg_py(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/WiFiState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/spot_msgs
)
_generate_msg_py(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/BatteryState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/spot_msgs
)
_generate_msg_py(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/BehaviorFaultState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/vini/P5/src/spot_ros/spot_msgs/msg/BehaviorFault.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/spot_msgs
)
_generate_msg_py(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/EStopState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/spot_msgs
)
_generate_msg_py(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/Feedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/spot_msgs
)
_generate_msg_py(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/FootState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/spot_msgs
)
_generate_msg_py(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/Lease.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/spot_msgs
)
_generate_msg_py(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/LeaseResource.msg"
  "${MSG_I_FLAGS}"
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/Lease.msg;/home/vini/P5/src/spot_ros/spot_msgs/msg/LeaseOwner.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/spot_msgs
)
_generate_msg_py(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/PowerState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/spot_msgs
)
_generate_msg_py(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/msg/SystemFaultState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/vini/P5/src/spot_ros/spot_msgs/msg/SystemFault.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/spot_msgs
)
_generate_msg_py(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/vini/P5/devel/share/spot_msgs/msg/NavigateToResult.msg;/home/vini/P5/devel/share/spot_msgs/msg/NavigateToActionGoal.msg;/home/vini/P5/devel/share/spot_msgs/msg/NavigateToGoal.msg;/home/vini/P5/devel/share/spot_msgs/msg/NavigateToFeedback.msg;/home/vini/P5/devel/share/spot_msgs/msg/NavigateToActionResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/vini/P5/devel/share/spot_msgs/msg/NavigateToActionFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/spot_msgs
)
_generate_msg_py(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/vini/P5/devel/share/spot_msgs/msg/NavigateToGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/spot_msgs
)
_generate_msg_py(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/vini/P5/devel/share/spot_msgs/msg/NavigateToResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/spot_msgs
)
_generate_msg_py(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/vini/P5/devel/share/spot_msgs/msg/NavigateToFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/spot_msgs
)
_generate_msg_py(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/spot_msgs
)
_generate_msg_py(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/spot_msgs
)
_generate_msg_py(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/spot_msgs
)
_generate_msg_py(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryAction.msg"
  "${MSG_I_FLAGS}"
  "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryActionResult.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryActionFeedback.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryGoal.msg;/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryResult.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Duration.msg;/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryActionGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/spot_msgs
)
_generate_msg_py(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryGoal.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Duration.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/spot_msgs
)
_generate_msg_py(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/spot_msgs
)
_generate_msg_py(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/spot_msgs
)
_generate_msg_py(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Duration.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/spot_msgs
)
_generate_msg_py(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/spot_msgs
)
_generate_msg_py(spot_msgs
  "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/spot_msgs
)

### Generating Services
_generate_srv_py(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/srv/ListGraph.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/spot_msgs
)
_generate_srv_py(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/srv/SetLocomotion.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/spot_msgs
)
_generate_srv_py(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/srv/SetVelocity.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/spot_msgs
)
_generate_srv_py(spot_msgs
  "/home/vini/P5/src/spot_ros/spot_msgs/srv/ClearBehaviorFault.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/spot_msgs
)

### Generating Module File
_generate_module_py(spot_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/spot_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(spot_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(spot_msgs_generate_messages spot_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/BatteryStateArray.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_py _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/BehaviorFault.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_py _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/EStopStateArray.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_py _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/FootStateArray.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_py _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/LeaseArray.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_py _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/LeaseOwner.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_py _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/Metrics.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_py _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/MobilityParams.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_py _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/SystemFault.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_py _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/WiFiState.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_py _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/BatteryState.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_py _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/BehaviorFaultState.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_py _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/EStopState.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_py _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/Feedback.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_py _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/FootState.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_py _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/Lease.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_py _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/LeaseResource.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_py _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/PowerState.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_py _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/msg/SystemFaultState.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_py _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToAction.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_py _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToActionGoal.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_py _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToActionResult.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_py _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToActionFeedback.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_py _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToGoal.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_py _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToResult.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_py _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/NavigateToFeedback.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_py _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryAction.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_py _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryActionGoal.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_py _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryActionResult.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_py _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryActionFeedback.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_py _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryGoal.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_py _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryResult.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_py _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/devel/share/spot_msgs/msg/TrajectoryFeedback.msg" NAME_WE)
add_dependencies(spot_msgs_generate_messages_py _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/srv/ListGraph.srv" NAME_WE)
add_dependencies(spot_msgs_generate_messages_py _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/srv/SetLocomotion.srv" NAME_WE)
add_dependencies(spot_msgs_generate_messages_py _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/srv/SetVelocity.srv" NAME_WE)
add_dependencies(spot_msgs_generate_messages_py _spot_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vini/P5/src/spot_ros/spot_msgs/srv/ClearBehaviorFault.srv" NAME_WE)
add_dependencies(spot_msgs_generate_messages_py _spot_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(spot_msgs_genpy)
add_dependencies(spot_msgs_genpy spot_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS spot_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/spot_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/spot_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(spot_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(spot_msgs_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET actionlib_msgs_generate_messages_cpp)
  add_dependencies(spot_msgs_generate_messages_cpp actionlib_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/spot_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/spot_msgs
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(spot_msgs_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(spot_msgs_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET actionlib_msgs_generate_messages_eus)
  add_dependencies(spot_msgs_generate_messages_eus actionlib_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/spot_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/spot_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(spot_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(spot_msgs_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET actionlib_msgs_generate_messages_lisp)
  add_dependencies(spot_msgs_generate_messages_lisp actionlib_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/spot_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/spot_msgs
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(spot_msgs_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(spot_msgs_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET actionlib_msgs_generate_messages_nodejs)
  add_dependencies(spot_msgs_generate_messages_nodejs actionlib_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/spot_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/spot_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/spot_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(spot_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(spot_msgs_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET actionlib_msgs_generate_messages_py)
  add_dependencies(spot_msgs_generate_messages_py actionlib_msgs_generate_messages_py)
endif()
