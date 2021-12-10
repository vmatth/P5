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

//Convert from Point32 to Point and convert to Robot Frame
geometry_msgs::Point convertPoint(geometry_msgs::Point32 p){
  geometry_msgs::Point newPoint = geometry_msgs::Point();
  newPoint.x = p.y;
  newPoint.y = p.x * -1;
  return newPoint;
}

void VisualizationLayer::bodyPointsCallback(const ros_openpose::BodyPoints::ConstPtr& msg){
  ROS_INFO("Receiving bodyPoints callback");
  int size = msg->LeftHip.size();

  //Loop each person
  int id = 0;

  //ROS_INFO("Left hip: (%f, %f)", msg->LeftHip[0].x, msg->LeftHip[0].y);
  //ROS_INFO("Left hip converted: (%f, %f)", convertPoint(msg->LeftHip[0]).x, convertPoint(msg->LeftHip[0]).y);

  for(int i = 0; i < size; i++){
    //Body Points
    visualizarPoint(convertPoint(msg->LeftHip[i]), i, 1.0);
    visualizarPoint(convertPoint(msg->RightHip[i]), i, 1.0);
    visualizarPoint(convertPoint(msg->RightKnee[i]), i, 0.5);
    visualizarPoint(convertPoint(msg->LeftHip[i]), i, 0.5);
    visualizarPoint(convertPoint(msg->LeftAnkle[i]), i, 0.1);
    visualizarPoint(convertPoint(msg->RightAnkle[i]), i, 0.1);
    //Lines
    // visualizarLine(convertPoint(msg->LeftHip[i]), convertPoint(msg->LeftKnee[i]), i, 1.0, 0.5);
    // visualizarLine(convertPoint(msg->LeftKnee[i]), convertPoint(msg->LeftAnkle[i]), i, 1.0, 0.5);    
    // visualizarLine(convertPoint(msg->RightHip[i]), convertPoint(msg->RightKnee[i]), i, 0.5, 0.1);
    // visualizarLine(convertPoint(msg->RightKnee[i]), convertPoint(msg->RightAnkle[i]), i, 0.5, 0.1);

  }


}

void VisualizationLayer::visualizarPoint(geometry_msgs::Point point, int color, double z){
  point = calculatePointRelativeToRobot(point);
  id++;
  //Color for each person
  float r = 1.0, g = 0.0, b = 0.0;
  if(color == 1){ r = 0.0; g = 1.0; b = 0.0;}
  else if(color == 2){ r = 0.0; g = 0.0; b = 1.0;}
  else if(color == 3){ r = 1.0; g = 1.0; b = 0.0;}
  else if(color == 4){ r = 0.0; g = 1.0; b = 1.0;}
  else if(color == 5){ r = 1.0; g = 0.0; b = 1.0;}

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
  marker.pose.orientation.w = 1.0;
  marker.lifetime = ros::Duration(1);
  marker.scale.x = 0.1;
  marker.scale.y = 0.1;
  marker.scale.z = 0.1;
  marker.color.a = 0.8; // Don't forget to set the alpha!
  marker.color.r = r;
  marker.color.g = g;
  marker.color.b = b;
  vis_pub.publish(marker);
}

void VisualizationLayer::visualizarLine(geometry_msgs::Point start, geometry_msgs::Point end, int color, double zStart, double zEnd){
  id++;
  //Color for each person
  float r = 1.0, g = 0.0, b = 0.0;
  if(color == 1){ r = 0.0; g = 1.0; b = 0.0;}
  else if(color == 2){ r = 0.0; g = 0.0; b = 1.0;}
  else if(color == 3){ r = 1.0; g = 1.0; b = 0.0;}
  else if(color == 4){ r = 0.0; g = 1.0; b = 1.0;}
  else if(color == 5){ r = 1.0; g = 0.0; b = 1.0;}
  visualization_msgs::Marker marker;
  marker.header.frame_id = "map";
  marker.header.stamp = ros::Time();
  marker.ns = "my_namespace";
  marker.id = id;
  marker.type = visualization_msgs::Marker::LINE_STRIP;
  marker.action = visualization_msgs::Marker::ADD;
  marker.pose.orientation.w = 1.0;
  marker.lifetime = ros::Duration(1);
  marker.scale.x = 0.1;
  marker.color.a = 0.8; // Don't forget to set the alpha!
  marker.color.r = r;
  marker.color.g = g;
  marker.color.b = b;
  start = calculatePointRelativeToRobot(start); start.z = zStart;
  end = calculatePointRelativeToRobot(end); end.z = zEnd;
  marker.points.push_back(start);
  marker.points.push_back(end);
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