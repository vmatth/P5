#ifndef FORMATION_LAYER_H_
#define FORMATION_LAYER_H_
#include <ros/ros.h>
#include <costmap_2d/layer.h>
#include <costmap_2d/layered_costmap.h>
#include <costmap_2d/GenericPluginConfig.h>
#include <dynamic_reconfigure/server.h>
#include <spot_pkg/people.h>
#include <geometry_msgs/Point.h>
#include <nav_msgs/Path.h>
#include <vector>

using namespace std;

namespace proxemics_layer_namespace
{

class ProxemicsLayer : public costmap_2d::Layer
{
public:
  ProxemicsLayer();

  virtual void onInitialize();
  virtual void updateBounds(double robot_x, double robot_y, double robot_yaw, double* min_x, double* min_y, double* max_x,
                             double* max_y); //The updateBounds method does not change the costmap just yet. It just defines the area that will need to be updated. We calculate the point we want to change (mark_x_, mark_y_) and then expand the min/max bounds to be sure it includes the new point. 
  virtual void updateCosts(costmap_2d::Costmap2D& master_grid, int min_i, int min_j, int max_i, int max_j); //First, we calculate which grid cell our point is in using worldToMap. Then we set the cost of that cell. Pretty simple. 

private:
  void reconfigureCB(costmap_2d::GenericPluginConfig &config, uint32_t level);
  void peopleCallback(const spot_pkg::people::ConstPtr& msg);
  void pathCallback(const nav_msgs::Path::ConstPtr& msg);

  geometry_msgs::Point calculatePointRelativeToRobot(geometry_msgs::Point point);
  vector<geometry_msgs::Point> calculateSurroundingPointsFromPersonCenter(geometry_msgs::Point center);
  vector<geometry_msgs::Point> createCircle(geometry_msgs::Point center, double radius, int amountOfPoints);
  
  void removePeoplePointsAfterSomeTime(); //Removes points after some time has passed

  double inflationRadius = 0.1;
  double pointTimer = 1.0; //Amount of seconds the points are active in the costmap

  double mark_x_, mark_y_;
  dynamic_reconfigure::Server<costmap_2d::GenericPluginConfig> *dsrv_;
  ros::NodeHandle nh;
  ros::Subscriber sub;
  ros::Subscriber path_sub;
  double xRobot, yRobot, yawRobot;
  vector<geometry_msgs::Point> peoplePoints; //Points stored in the costmap. Points here will be removed after 1 second.
  vector<double> timeToRemove; //Each index contains the TIME when to remove points from costmapPoints
  vector<int> pointsToRemove; //Each index contains the AMOUNT of points to remove from costmapPoints
  bool robotMoving = false;
};
}
#endif