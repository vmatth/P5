#include <simple_layer.h>
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
  ROS_INFO("Receiving points from callback");
    int size = msg->points.size();
  //Loop all points
  for(int i = 0; i < size; i++){

    geometry_msgs::Point newPoint = geometry_msgs::Point();
    newPoint.x = msg->points[i].x;
    newPoint.y = msg->points[i].y;

    costmapPoints.push_back(newPoint);
  }
}

void SimpleLayer::onInitialize()
{
  ros::NodeHandle nh("~/" + name_);
  current_ = true;

  ros::Subscriber sub = nh.subscribe("/formations", 1000, &SimpleLayer::formationCallback, this);

  ros::spin();
}

void SimpleLayer::updateCosts(costmap_2d::Costmap2D& master_grid, int min_i, int min_j, int max_i,
                                          int max_j)
{
  if (!enabled_)
    return;

  unsigned int mx;
  unsigned int my;

  //Add points to
  for(int i = 0; i < costmapPoints.size(); i++){
    if(master_grid.worldToMap(costmapPoints[i].x, costmapPoints[i].y, mx, my)){
      master_grid.setCost(mx, my, LETHAL_OBSTACLE);
    }
  }


}


} // end namespace