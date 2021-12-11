# P5 AAU Project

## Setup

Install ros melodic: http://wiki.ros.org/melodic

Install spot package: https://github.com/clearpathrobotics/spot_ros

Install catkin-pkg:
```
sudo apt install python3-catkin-pkg
```

Build P5 (in P5 repo)

Build with python3 for x86_64 processors
```
catkin_make --cmake-args -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3 -DPYTHON_INCLUDE_DIR=/usr/include/python3.6m -DPYTHON_LIBRARY=/usr/lib/x86_64-linux-gnu/libpython3.6m.so
```
Build wit python3 for arm processors
```
catkin_make --cmake-args -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3 -DPYTHON_INCLUDE_DIR=/usr/include/python3.6m -DPYTHON_LIBRARY=/usr/lib/aarch64-linux-gnu/libpython3.6m.so
```

If catkin_make gives the error 
```
  Could not find a package configuration file provided by "move_base_msgs"
  with any of the following names:

    move_base_msgsConfig.cmake
    move_base_msgs-config.cmake
```
Install the invididual package with:
```
sudo apt-get install ros-melodic-move-base-msgs
```
or install all dependencies for a package
```
rosdep install spot_pkg
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
## Launching the nodes on SPOT

Launch the nodes to boot SPOT

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
All of these launch files can be launched at once with
```
roslaunch spot_pkg all.launch
```

## Gmapping

To map your environment run gmapping

```
rosrun gmapping slam_gmapping 
```
(Lidar must be runinng before gmapping can be run)

Save the map

In a new terminal:
```
rosrun map_server map_saver -f "name"
```
##Launching the camera and f-formation detection

```
roslaunch ros_openpose run.launch
rosrun ros_openpose persondata.py
rosrun ros_openpose f_formation_ros.py
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
