#ifndef VISUALIZATION_LAYER_H_
#define VISUALIZATION_LAYER_H_
#include <ros/ros.h>
#include <costmap_2d/layer.h>
#include <costmap_2d/layered_costmap.h>
#include <costmap_2d/GenericPluginConfig.h>
#include <dynamic_reconfigure/server.h>
#include <geometry_msgs/Point.h>
#include <ros_openpose/BodyPoints.h>
#include <visualization_msgs/Marker.h>
#include <vector>

using namespace std;

namespace visualization_layer_namespace
{

class VisualizationLayer : public costmap_2d::Layer
{
public:
  VisualizationLayer();

  virtual void onInitialize();
  virtual void updateBounds(double robot_x, double robot_y, double robot_yaw, double* min_x, double* min_y, double* max_x,
                             double* max_y); //The updateBounds method does not change the costmap just yet. It just defines the area that will need to be updated. We calculate the point we want to change (mark_x_, mark_y_) and then expand the min/max bounds to be sure it includes the new point. 
private:
  void reconfigureCB(costmap_2d::GenericPluginConfig &config, uint32_t level);
  void bodyPointsCallback(const ros_openpose::BodyPoints::ConstPtr& msg);

  void visualizarPoint(geometry_msgs::Point point, int id, double z);

  geometry_msgs::Point calculatePointRelativeToRobot(geometry_msgs::Point point);

  double mark_x_, mark_y_;
  dynamic_reconfigure::Server<costmap_2d::GenericPluginConfig> *dsrv_;
  ros::NodeHandle nh;
  ros::Subscriber sub;
  ros::Publisher vis_pub; 
  double xRobot, yRobot, yawRobot;
};
}
#endif