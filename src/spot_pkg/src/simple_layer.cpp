#include <spot_pkg/simple_layer.h>
#include <pluginlib/class_list_macros.h>
#include <geometry_msgs/Point.h>
#include<vector>


using namespace std;

PLUGINLIB_EXPORT_CLASS(simple_layer_namespace::SimpleLayer, costmap_2d::Layer)

using costmap_2d::LETHAL_OBSTACLE;

namespace simple_layer_namespace
{

SimpleLayer::SimpleLayer() {}

vector<geometry_msgs::Point> costmapPoints;

void SimpleLayer::formationCallback(const spot_pkg::formationPoints::ConstPtr& msg){
  ROS_INFO("Receiving points from formation callback");
  int size = msg->points.size();
  ROS_INFO("Amount of points: %i", size);
  //Loop all f-formation points
  //costmapPoints.clear();
  for(int i = 0; i < size; i++){

    geometry_msgs::Point newPoint = geometry_msgs::Point();
    newPoint.x = msg->points[i].x;
    newPoint.y = msg->points[i].y;

    costmapPoints.push_back(newPoint);
  }
}

void SimpleLayer::onInitialize()
{
  current_ = true;
  sub = nh.subscribe("/formations", 1000, &SimpleLayer::formationCallback, this);

  dsrv_ = new dynamic_reconfigure::Server<costmap_2d::GenericPluginConfig>(nh);
  dynamic_reconfigure::Server<costmap_2d::GenericPluginConfig>::CallbackType cb = boost::bind(
      &SimpleLayer::reconfigureCB, this, _1, _2);
  dsrv_->setCallback(cb);

}

void SimpleLayer::reconfigureCB(costmap_2d::GenericPluginConfig &config, uint32_t level)
{
  enabled_ = config.enabled;
}

void SimpleLayer::updateBounds(double robot_x, double robot_y, double robot_yaw, double* min_x,
                                           double* min_y, double* max_x, double* max_y)
{
  if (!enabled_)
    return;

  ROS_INFO("Updating bounds");

  mark_x_ = robot_x;
  mark_y_ = robot_y;

  xRobot = robot_x;
  yRobot = robot_y;
  yawRobot = robot_yaw;


  *min_x = std::min(*min_x, mark_x_);
  *min_y = std::min(*min_y, mark_y_);
  *max_x = std::max(*max_x, mark_x_);
  *max_y = std::max(*max_y, mark_y_);
}

void SimpleLayer::updateCosts(costmap_2d::Costmap2D& master_grid, int min_i, int min_j, int max_i,
                                          int max_j)
{
  if (!enabled_)
    return;

  ROS_INFO("Updating costs");

  unsigned int mx;
  unsigned int my;

  // for(int i = 0; i < 10; i++){
  //   if(master_grid.worldToMap(mark_x_ * i, mark_y_ * i, mx, my)){
  //     master_grid.setCost(mx, my, LETHAL_OBSTACLE);
  //     ROS_INFO("mx : %d, my: %d", mx, my);
  //   }
  // }

  for(int i = 0; i < costmapPoints.size(); i++){

    //Caluclate the formation point relative to the robot's rotation
    double xPoint = costmapPoints[i].x * cos(yawRobot) - costmapPoints[i].y * sin(yawRobot);
    double yPoint = costmapPoints[i].x * sin(yawRobot) + costmapPoints[i].y * cos(yawRobot);

    //Calculate the formation point relative to the robot's position

    xPoint += xRobot;
    yPoint += yRobot;

    if(master_grid.worldToMap(xPoint, yPoint, mx, my)){
      master_grid.setCost(mx, my, LETHAL_OBSTACLE);
      ROS_INFO("RobotPoint: (%f, %f), formationPoint: (%f, %f), yaw: %f, FinalPoint: (%f, %f)", xRobot, yRobot, costmapPoints[i].x, costmapPoints[i].y, yawRobot, xPoint, yPoint);
    }
  }
}


} // end namespace