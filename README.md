# P5 AAU Project

## Setup

Install ros melodic: http://wiki.ros.org/melodic

Install spot package: https://github.com/clearpathrobotics/spot_ros

Install ros dependencies and packages

```
rosdep install spot_pkg
sudo apt-get install ros-melodic-map-server
sudo apt-get install ros-melodic-amcl
sudo apt-get install ros-melodic-slam-gmapping
sudo apt-get install ros-melodic-move-base
sudo apt-get install ros-melodic-move-base-msgs
```
Build P5 (in P5 repo)

```
catkin_make
```

Source P5 (in P5 repo)

```
source devel/setup.bash
```
(This can also be added to .bashrc)

## Running the nodes on spot

Remember to connect to SPOT's wifi

To run the ROS nodes

```
roslaunch spot_pkg boot.launch
roslaunch spot_pkg lidar.launch
roslaunch spot_pkg move_base.launch
```

To open SPOT in rviz
```
roslaunch spot_pkg rviz.launch
```




## Pose estimation SETUP

```
pip3 install -U scikit-learn
pip3 install more-itertools
``` 
