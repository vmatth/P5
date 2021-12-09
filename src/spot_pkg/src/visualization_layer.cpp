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

geometry_msgs::Point VisualizationLayer::convertPointToRobotFrame(geometry_msgs::Point point){
  geometry_msgs::Point newPoint = geometry_msgs::Point();
  newPoint.x = point.y;
  newPoint.y = point.x * -1;
}

//Convert from Point32 to Point for some reason
geometry_msgs::Point getPoint(geometry_msgs::Point32 p){
  geometry_msgs::Point newPoint = geometry_msgs::Point();
  newPoint.x = p.x;
  newPoint.y = p.y;
}

void VisualizationLayer::bodyPointsCallback(const ros_openpose::BodyPoints::ConstPtr& msg){
  ROS_INFO("Receiving bodyPoints callback");
  int size = msg->LeftHip.size();

  //Loop each person
  int id = 0;

  for(int i = 0; i < size; i++){
    //Body Points
    visualizarPoint(getPoint(msg->LeftHip[i]), id + 0, 1.0);
    visualizarPoint(getPoint(msg->RightHip[i]), id + 1, 1.0);
    visualizarPoint(getPoint(msg->RightKnee[i]), id + 2, 0.5);
    visualizarPoint(getPoint(msg->LeftHip[i]), id + 3, 0.5);
    visualizarPoint(getPoint(msg->LeftAnkle[i]), id + 4, 0.1);
    visualizarPoint(getPoint(msg->RightAnkle[i]), id + 5, 0.1);
    //Lines
    visualizarLine(getPoint(msg->LeftHip[i]), getPoint(msg->LeftKnee[i]), id + 6);
    visualizarLine(getPoint(msg->LeftKnee[i]), getPoint(msg->LeftAnkle[i]), id + 7);    
    visualizarLine(getPoint(msg->RightHip[i]), getPoint(msg->RightKnee[i]), id + 8);
    visualizarLine(getPoint(msg->RightKnee[i]), getPoint(msg->RightAnkle[i]), id + 9);
    int id = id + 10;
  }


}

void VisualizationLayer::visualizarPoint(geometry_msgs::Point point, int id, double z){
  point = calculatePointRelativeToRobot(convertPointToRobotFrame(point));

  //Color for each person
  float r = 1.0, g = 0.0, b = 0.0;
  if(id == 1){ r = 0.0; g = 1.0; b = 0.0;}
  else if(id == 2){ r = 0.0; g = 0.0; b = 1.0;}
  else if(id == 3){ r = 1.0; g = 1.0; b = 0.0;}
  else if(id == 4){ r = 0.0; g = 1.0; b = 1.0;}
  else if(id == 5){ r = 1.0; g = 0.0; b = 1.0;}

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
  marker.scale.x = 0.3;
  marker.scale.y = 0.3;
  marker.scale.z = 0.3;
  marker.color.a = 0.8; // Don't forget to set the alpha!
  marker.color.r = r;
  marker.color.g = g;
  marker.color.b = b;
  vis_pub.publish(marker);
}

void VisualizationLayer::visualizarLine(geometry_msgs::Point start, geometry_msgs::Point end, int id){
  //Color for each person
  float r = 1.0, g = 0.0, b = 0.0;
  if(id == 1){ r = 0.0; g = 1.0; b = 0.0;}
  else if(id == 2){ r = 0.0; g = 0.0; b = 1.0;}
  else if(id == 3){ r = 1.0; g = 1.0; b = 0.0;}
  else if(id == 4){ r = 0.0; g = 1.0; b = 1.0;}
  else if(id == 5){ r = 1.0; g = 0.0; b = 1.0;}
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