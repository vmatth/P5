#ifndef SIMPLE_LAYER_H_
#define SIMPLE_LAYER_H_
#include <ros/ros.h>
#include <costmap_2d/layer.h>
#include <costmap_2d/layered_costmap.h>
#include <costmap_2d/GenericPluginConfig.h>
#include <dynamic_reconfigure/server.h>
#include <spot_pkg/formationPoints.h>

namespace simple_layer_namespace
{

class SimpleLayer : public costmap_2d::Layer
{
public:
  SimpleLayer();

  virtual void onInitialize();
  virtual void updateBounds(double robot_x, double robot_y, double robot_yaw, double* min_x, double* min_y, double* max_x,
                             double* max_y); //The updateBounds method does not change the costmap just yet. It just defines the area that will need to be updated. We calculate the point we want to change (mark_x_, mark_y_) and then expand the min/max bounds to be sure it includes the new point. 
  virtual void updateCosts(costmap_2d::Costmap2D& master_grid, int min_i, int min_j, int max_i, int max_j); //First, we calculate which grid cell our point is in using worldToMap. Then we set the cost of that cell. Pretty simple. 

private:
  void reconfigureCB(costmap_2d::GenericPluginConfig &config, uint32_t level);

  void formationCallback(const spot_pkg::formationPoints::ConstPtr& msg);

  double mark_x_, mark_y_;
  dynamic_reconfigure::Server<costmap_2d::GenericPluginConfig> *dsrv_;
};
}
#endif