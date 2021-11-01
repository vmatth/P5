# P5 AAU Project

Setup
Install ros melodic: http://wiki.ros.org/melodic
Install spot package: https://github.com/clearpathrobotics/spot_ros

Install ros dependencies

```
rosdep install spot_pkg
```
Build P5 (in P5 repo)

```
catkin_make
```

Source P5 (in P5 repo)

```
source devel/setup.bash
```
Remember to connect to SPOT's wifi

To run the ROS nodes

```
roslaunch spot_pkg boot.launch
rosrun spot_pkg spot_pkg_node
```

To open SPOT in rviz
```
roslaunch spot_viz view_robot.launch
```



