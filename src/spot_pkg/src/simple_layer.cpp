#include <spot_pkg/simple_layer.h>
#include <pluginlib/class_list_macros.h>
#include <geometry_msgs/Point.h>
#include<vector>
#include <boost/bind.hpp>
#include <boost/shared_ptr.hpp>
#include <boost/function.hpp>


using namespace std;


PLUGINLIB_EXPORT_CLASS(simple_layer_namespace::SimpleLayer, costmap_2d::Layer)

using costmap_2d::LETHAL_OBSTACLE;

namespace simple_layer_namespace
{

SimpleLayer::SimpleLayer() {
  //ros::NodeHandle nh("~/" + name_);

}

vector<geometry_msgs::Point> costmapPoints;

void SimpleLayer::formationCallback(const boost::shared_ptr<spot_pkg::formationPoints const>,  &msg){
  ROS_INFO("boi");
}
// void SimpleLayer::formationCallback(const spot_pkg::formationPoints::ConstPtr& msg){
//   ROS_INFO("Receiving points from formation callback");
//   int size = msg->points.size();
//   ROS_INFO("Amount of points: %i", size);

//   //Loop all f-formation points
//   for(int i = 0; i < size; i++){

//     geometry_msgs::Point newPoint = geometry_msgs::Point();
//     newPoint.x = msg->points[i].x;
//     newPoint.y = msg->points[i].y;

//     costmapPoints.push_back(newPoint);
//   }



// }

void SimpleLayer::onInitialize()
{
  ros::NodeHandle nh("~/" + name_);
  current_ = true;
 // ros::Subscriber sub = nh.subscribe("/formations", 1000, &SimpleLayer::formationCallback, this);

}

void SimpleLayer::updateBounds(double robot_x, double robot_y, double robot_yaw, double* min_x,
                                           double* min_y, double* max_x, double* max_y)
{
  if (!enabled_)
    return;

  mark_x_ = robot_x + 2 *cos(robot_yaw);
  mark_y_ = robot_y + 2* sin(robot_yaw);

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

  unsigned int mx;
  unsigned int my;

  for(int i = 0; i < costmapPoints.size(); i++){
    if(master_grid.worldToMap(costmapPoints[i].x, costmapPoints[i].y, mx, my)){
      master_grid.setCost(mx, my, LETHAL_OBSTACLE);
    }
  }


}


} // end namespace