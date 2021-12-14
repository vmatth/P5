#include <spot_pkg/tracker_layer.h>
#include <pluginlib/class_list_macros.h>
#include <geometry_msgs/Point.h>
#include <visualization_msgs/Marker.h>
#include <vector>
#include <iostream>
#include <fstream>
#include <string.h>

using namespace std;

PLUGINLIB_EXPORT_CLASS(tracker_layer_namespace::TrackerLayer, costmap_2d::Layer)

using costmap_2d::LETHAL_OBSTACLE;

namespace tracker_layer_namespace
{

TrackerLayer::TrackerLayer() {
} 


void TrackerLayer::visualizarPoint(geometry_msgs::Point point){
  id++;
  visualization_msgs::Marker marker;
  marker.header.frame_id = "map";
  marker.header.stamp = ros::Time();
  marker.ns = "my_namespace";
  marker.id = id;
  marker.type = visualization_msgs::Marker::SPHERE;
  marker.action = visualization_msgs::Marker::ADD;
  marker.pose.position.x = point.x;
  marker.pose.position.y = point.y; 
  marker.pose.position.z = point.z;//+1.0 because we test while spot is on the ground
  marker.pose.orientation.w = 1.0;
  marker.scale.x = 0.05;
  marker.scale.y = 0.05;
  marker.scale.z = 0.05;
  marker.color.a = 0; // Don't forget to set the alpha!
  marker.color.r = 0;
  marker.color.g = 1;
  marker.color.b = 0;
  vis_pub.publish(marker);

  if(prevPoint.x != 0 && prevPoint.y != 0){
    visualizarLine(prevPoint, point);
  }

  prevPoint = point;
}

void TrackerLayer::visualizarLine(geometry_msgs::Point start, geometry_msgs::Point end){
  id++;
  visualization_msgs::Marker marker;
  marker.header.frame_id = "map";
  marker.header.stamp = ros::Time();
  marker.ns = "my_namespace";
  marker.id = id;
  marker.type = visualization_msgs::Marker::LINE_STRIP;
  marker.action = visualization_msgs::Marker::ADD;
  marker.pose.orientation.w = 1.0;
  marker.scale.x = 0.025;
  marker.color.a = 0.8; // Don't forget to set the alpha!
  marker.color.r = 0;
  marker.color.g = 0;
  marker.color.b = 1;
  start.z = start.z;
  end.z = end.z;
  marker.points.push_back(start);
  marker.points.push_back(end);
  vis_pub.publish(marker);  
}


geometry_msgs::Point TrackerLayer::calculatePointRelativeToRobot(geometry_msgs::Point point){
  geometry_msgs::Point newPoint = geometry_msgs::Point();
  //Caluclate the formation point relative to the robot's rotation
  newPoint.x = point.x * cos(yawRobot) - point.y * sin(yawRobot);
  newPoint.y = point.x * sin(yawRobot) + point.y * cos(yawRobot);

  //Calculate the formation point relative to the robot's position
  newPoint.x += xRobot;
  newPoint.y += yRobot;
  newPoint.z = point.z;
  //ROS_INFO("Calculating poont relativve ro robot, yawRobot: %f, xRobot; %f, yRobot: %f, inputPoint(%f, %f", yawRobot, xRobot, yRobot, point.x, point.y);
  return newPoint;
}

void TrackerLayer::pathCallback(const nav_msgs::Path::ConstPtr& msg){
  startTracking = true;
}

void TrackerLayer::onInitialize()
{
  current_ = true;  
  vis_pub = nh.advertise<visualization_msgs::Marker>( "visualization_marker", 0 );
  odom_pub = nh.advertise<geometry_msgs::Point>( "o", 0 );
  sub = nh.subscribe("/move_base/TrajectoryPlannerROS/global_plan", 1000, &TrackerLayer::pathCallback, this);

  dsrv_ = new dynamic_reconfigure::Server<costmap_2d::GenericPluginConfig>(nh);
  dynamic_reconfigure::Server<costmap_2d::GenericPluginConfig>::CallbackType cb = boost::bind(
      &TrackerLayer::reconfigureCB, this, _1, _2);
  dsrv_->setCallback(cb);

}

void TrackerLayer::reconfigureCB(costmap_2d::GenericPluginConfig &config, uint32_t level)
{
  enabled_ = config.enabled;
}

void TrackerLayer::updateBounds(double robot_x, double robot_y, double robot_yaw, double* min_x,
                                           double* min_y, double* max_x, double* max_y)
{
  if (!enabled_)
    return;

  mark_x_ = robot_x;
  mark_y_ = robot_y;

  xRobot = robot_x;
  yRobot = robot_y;
  yawRobot = robot_yaw;

  *min_x = std::min(*min_x, mark_x_);
  *min_y = std::min(*min_y, mark_y_);
  *max_x = std::max(*max_x, mark_x_);
  *max_y = std::max(*max_y, mark_y_);

  geometry_msgs::Point p; p.x = xRobot; p.y = yRobot;

  if(startTracking){
    odom_pub.publish(p);
    visualizarPoint(p);
  }
}


} // end namespace