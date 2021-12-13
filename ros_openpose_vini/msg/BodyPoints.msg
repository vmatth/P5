# The location and score of body parts are stored in a float array.
# Therefore we are using 32 bits instead of 64 bits.
# src: https://github.com/CMU-Perceptual-Computing-Lab/openpose/blob/master/include/openpose/core/datum.hpp
# The location has been resized to the desired output
# resolution (e.g., `resolution` flag in the demo).

geometry_msgs/Point32[] LeftHip
geometry_msgs/Point32[] RightHip
geometry_msgs/Point32[] LeftAnkle
geometry_msgs/Point32[] RightAnkle
geometry_msgs/Point32[] RightKnee
geometry_msgs/Point32[] LeftKnee


