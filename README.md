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

sudo apt-get install ros-melodic-twist-mux
sudo apt-get install ros-melodic-teleop-twist-joy
sudo apt-get install ros-melodic-joy
sudo apt-get install ros-melodic-interactive-marker-twist-server
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
(Remember to restart the terminal after adding to .bashrc)

## Network connection

### WiFi

Change ip address in boot.launch to 
```
192.168.80.3
```
### Ethernet

Change ip address in boot.launch to
```
192.168.50.3
```
In ubuntu's network settings change Ipv4 settings to manual and insert your address as
```
192.168.50.1
```
Insert Netmask as
```
24
```
## Running the nodes on spot

To run the ROS nodes

```
roslaunch spot_pkg boot.launch
roslaunch spot_pkg lidar.launch
roslaunch spot_pkg move_base.launch
```
(Lidar must be running before move_base can be launched)

To open SPOT in rviz
```
roslaunch spot_pkg rviz.launch
```
## Gmapping

```
rosrun gmapping slam_gmapping 
```
(Lidar must be runinng before gmapping can be run)

Save the map

In a new terminal:
```
rosrun map_server map_saver -f "name"
```


## Pose estimation installation (Jetson AGX Xavier)

```
git clone https://github.com/FREEWING-JP/Jetson_Convenience_Script#openpose-v170
```
```
sudo apt-get remove cmake
```
```
bash ./Jetson_Convenience_Script/CMake/inst_CMake.sh
```

change path of opencv4:
```
gedit Jetson_Convenience_Script/OpenPose/inst_OpenPose.sh
OpenCV_DIR=/usr/lib/aarch64-linux-gnu/cmake/opencv4
```

```
bash ./Jetson_Convenience_Script/OpenPose/inst_OpenPose.sh
```
```
sudo apt-get install ros-melodic-realsense2-camera
sudo apt install libcanberra-gtk-module libcanberra-gtk3-module
sudo pip3 uninstall scipy
pip install -U scikit-learn
pip3 install numpy==1.19.4
``` 
remenber numpy version 1.19.4 and scipy version 1.14??
