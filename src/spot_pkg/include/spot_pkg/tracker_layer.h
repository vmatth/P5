#ifndef TRACKING_LAYER_H_
#define TRACKING_LAYER_H_
#include <ros/ros.h>
#include <costmap_2d/layer.h>
#include <costmap_2d/layered_costmap.h>
#include <costmap_2d/GenericPluginConfig.h>
#include <dynamic_reconfigure/server.h>
#include <geometry_msgs/Point.h>
#include <visualization_msgs/Marker.h>
#include <nav_msgs/Path.h>
#include <vector>
#include <iostream>
#include <fstream>

using namespace std;

namespace tracker_layer_namespace
{

class TrackerLayer : public costmap_2d::Layer
{
public:
  TrackerLayer();

  virtual void onInitialize();
  virtual void updateBounds(double robot_x, double robot_y, double robot_yaw, double* min_x, double* min_y, double* max_x,
                             double* max_y); //The updateBounds method does not change the costmap just yet. It just defines the area that will need to be updated. We calculate the point we want to change (mark_x_, mark_y_) and then expand the min/max bounds to be sure it includes the new point. 
private:
  void reconfigureCB(costmap_2d::GenericPluginConfig &config, uint32_t level);
  void pathCallback(const nav_msgs::Path::ConstPtr& msg);

  void visualizarLine(geometry_msgs::Point start, geometry_msgs::Point end);
  void visualizarPoint(geometry_msgs::Point point);

  geometry_msgs::Point convertPointToRobotFrame(geometry_msgs::Point point);
  geometry_msgs::Point calculatePointRelativeToRobot(geometry_msgs::Point point);

  geometry_msgs::Point prevPoint;

  double mark_x_, mark_y_;
  dynamic_reconfigure::Server<costmap_2d::GenericPluginConfig> *dsrv_;
  ros::NodeHandle nh;
  ros::Publisher vis_pub; 
  ros::Subscriber sub;
  double xRobot, yRobot, yawRobot;
  int id = 0;

  bool startTracking = false;
  std::ofstream odomFile;
};
}
#endif