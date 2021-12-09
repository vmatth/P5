#include <spot_pkg/visualization_layer.h>
#include <pluginlib/class_list_macros.h>
#include <geometry_msgs/Point.h>
#include <ros_openpose/BodyPoints.h>
#include <visualization_msgs/Marker.h>
#include <vector>


using namespace std;

PLUGINLIB_EXPORT_CLASS(visualization_layer_namespace::VisualizationLayer, costmap_2d::Layer)

using costmap_2d::LETHAL_OBSTACLE;

namespace visualization_layer_namespace
{

VisualizationLayer::VisualizationLayer() {}   

void VisualizationLayer::bodyPointsCallback(const ros_openpose::BodyPoints::ConstPtr& msg){
  ROS_INFO("Receiving bodyPoints callback");
  int size = msg->LeftHip.size();

  int id = 0;

  //Loop all leftHips 
  for(int i = 0; i < size; i++){
    //Convert the point to the correct x,y frame (from camera frame to spots frame)
    geometry_msgs::Point newPoint = geometry_msgs::Point();
    newPoint.x = msg->LeftHip[i].y;
    newPoint.y = msg->LeftHip[i].x * -1;
    visualizarPoint(calculatePointRelativeToRobot(newPoint), id, 1.0);
    id++;
  }
  //Loop all rightHips 
  for(int i = 0; i < size; i++){
    //Convert the point to the correct x,y frame (from camera frame to spots frame)
    geometry_msgs::Point newPoint = geometry_msgs::Point();
    newPoint.x = msg->RightHip[i].y;
    newPoint.y = msg->RightHip[i].x * -1; 
    visualizarPoint(calculatePointRelativeToRobot(newPoint), id, 1.0);
    id++;
  }
  //Loop all leftAnkle 
  for(int i = 0; i < size; i++){
    //Convert the point to the correct x,y frame (from camera frame to spots frame)
    geometry_msgs::Point newPoint = geometry_msgs::Point();
    newPoint.x = msg->LeftAnkle[i].y;
    newPoint.y = msg->LeftAnkle[i].x * -1;
    visualizarPoint(calculatePointRelativeToRobot(newPoint), id, 0.5);
    id++;
  }
  //Loop all rightAnkle 
  for(int i = 0; i < size; i++){
    //Convert the point to the correct x,y frame (from camera frame to spots frame)
    geometry_msgs::Point newPoint = geometry_msgs::Point();
    newPoint.x = msg->RightAnkle[i].y;
    newPoint.y = msg->RightAnkle[i].x * -1;
    visualizarPoint(calculatePointRelativeToRobot(newPoint), id, 0.5);
    id++;
  }
    //Loop all leftKnee 
  for(int i = 0; i < size; i++){
    //Convert the point to the correct x,y frame (from camera frame to spots frame)
    geometry_msgs::Point newPoint = geometry_msgs::Point();
    newPoint.x = msg->LeftKnee[i].y;
    newPoint.y = msg->LeftKnee[i].x * -1;
    visualizarPoint(calculatePointRelativeToRobot(newPoint), id, 0.5);
    id++;
  }
  //Loop all rightKnee
  for(int i = 0; i < size; i++){
    //Convert the point to the correct x,y frame (from camera frame to spots frame)
    geometry_msgs::Point newPoint = geometry_msgs::Point();
    newPoint.x = msg->RightKnee[i].y;
    newPoint.y = msg->RightKnee[i].x * -1;
    visualizarPoint(calculatePointRelativeToRobot(newPoint), id, 0.5);
    id++;
  }


}

void VisualizationLayer::visualizarPoint(geometry_msgs::Point point, int id, double z){
  visualization_msgs::Marker marker;
  marker.header.frame_id = "map";
  marker.header.stamp = ros::Time();
  marker.ns = "my_namespace";
  marker.id = id;
  marker.type = visualization_msgs::Marker::SPHERE;
  marker.action = visualization_msgs::Marker::ADD;
  marker.pose.position.x = point.x;
  marker.pose.position.y = point.y;
  marker.pose.position.z = z;
  marker.pose.orientation.x = 0.0;
  marker.pose.orientation.y = 0.0;
  marker.pose.orientation.z = 0.0;
  marker.pose.orientation.w = 1.0;
  marker.lifetime = ros::Duration(0.2);
  marker.scale.x = 0.05;
  marker.scale.y = 0.05;
  marker.scale.z = 0.05;
  marker.color.a = 0.8; // Don't forget to set the alpha!
  marker.color.r = 0.0;
  marker.color.g = 1.0;
  marker.color.b = 0.0;
  vis_pub.publish(marker);

}


geometry_msgs::Point VisualizationLayer::calculatePointRelativeToRobot(geometry_msgs::Point point){
  geometry_msgs::Point newPoint = geometry_msgs::Point();
  //Caluclate the formation point relative to the robot's rotation
  newPoint.x = point.x * cos(yawRobot) - point.y * sin(yawRobot);
  newPoint.y = point.x * sin(yawRobot) + point.y * cos(yawRobot);

  //Calculate the formation point relative to the robot's position
  newPoint.x += xRobot;
  newPoint.y += yRobot;
  //ROS_INFO("Calculating poont relativve ro robot, yawRobot: %f, xRobot; %f, yRobot: %f, inputPoint(%f, %f", yawRobot, xRobot, yRobot, point.x, point.y);
  return newPoint;
}

void VisualizationLayer::onInitialize()
{
  current_ = true;
  sub = nh.subscribe("/BodyPoints", 1000, &VisualizationLayer::bodyPointsCallback, this);
  vis_pub = nh.advertise<visualization_msgs::Marker>( "visualization_marker", 0 );

  dsrv_ = new dynamic_reconfigure::Server<costmap_2d::GenericPluginConfig>(nh);
  dynamic_reconfigure::Server<costmap_2d::GenericPluginConfig>::CallbackType cb = boost::bind(
      &VisualizationLayer::reconfigureCB, this, _1, _2);
  dsrv_->setCallback(cb);

}

void VisualizationLayer::reconfigureCB(costmap_2d::GenericPluginConfig &config, uint32_t level)
{
  enabled_ = config.enabled;
}

void VisualizationLayer::updateBounds(double robot_x, double robot_y, double robot_yaw, double* min_x,
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
}


} // end namespace