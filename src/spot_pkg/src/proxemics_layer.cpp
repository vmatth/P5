#include <spot_pkg/proxemics_layer.h>
#include <pluginlib/class_list_macros.h>
#include <geometry_msgs/Point.h>
#include <spot_pkg/people.h>
#include <vector>

using namespace std;

PLUGINLIB_EXPORT_CLASS(proxemics_layer_namespace::ProxemicsLayer, costmap_2d::Layer)

using costmap_2d::LETHAL_OBSTACLE;

namespace proxemics_layer_namespace
{


ProxemicsLayer::ProxemicsLayer() {}   

void ProxemicsLayer::peopleCallback(const spot_pkg::people::ConstPtr& msg){
  if(robotMoving == true) return;
  //ROS_INFO("Receiving points from people callback");
  int size = msg->people.size();
  //ROS_INFO("Amount of people: %i", size);

  //Loop all people 
  for(int i = 0; i < size; i++){
    //ROS_INFO("Receiving point: (%f, %f, %f)", msg->people[i].position.x, msg->people[i].position.y, msg->people[i].position.z);

    geometry_msgs::Point newPoint = geometry_msgs::Point();
    newPoint.x = msg->people[i].position.x;
    newPoint.y = msg->people[i].position.y;

    peoplePoints.push_back(calculatePointRelativeToRobot(newPoint));
  }

    timeToRemove.push_back(ros::Time::now().toSec() + pointTimer);
    pointsToRemove.push_back(size);

}

void ProxemicsLayer::pathCallback(const nav_msgs::Path::ConstPtr& msg){
  ROS_INFO("ROBOT IS MOVING!!!!");
  robotMoving = true;
}


geometry_msgs::Point ProxemicsLayer::calculatePointRelativeToRobot(geometry_msgs::Point point){
  geometry_msgs::Point newPoint = geometry_msgs::Point();
  //Caluclate the formation point relative to the robot's rotation
  newPoint.x = point.x * cos(yawRobot) - point.y * sin(yawRobot);
  newPoint.y = point.x * sin(yawRobot) + point.y * cos(yawRobot);

  //Calculate the formation point relative to the robot's position
  newPoint.x += xRobot;
  newPoint.y += yRobot;
  //ROS_INFO("Calculating poont relativve ro robot, yawRobot: %f, xRobot; %f, yRobot: %f, inputPoint(%f, %f", yawRobot, xRobot, yRobot, point.x, point.y);
  //ROS_INFO("relative point: (%f, %f, %f)", newPoint.x, newPoint.y, newPoint.z);

  return newPoint;
}

void ProxemicsLayer::onInitialize()
{
  current_ = true;
  sub = nh.subscribe("/people", 1000, &ProxemicsLayer::peopleCallback, this);
  path_sub = nh.subscribe("/move_base/TrajectoryPlannerROS/global_plan", 1000, &ProxemicsLayer::pathCallback, this);

  dsrv_ = new dynamic_reconfigure::Server<costmap_2d::GenericPluginConfig>(nh);
  dynamic_reconfigure::Server<costmap_2d::GenericPluginConfig>::CallbackType cb = boost::bind(
      &ProxemicsLayer::reconfigureCB, this, _1, _2);
  dsrv_->setCallback(cb);

}

void ProxemicsLayer::reconfigureCB(costmap_2d::GenericPluginConfig &config, uint32_t level)
{
  enabled_ = config.enabled;
}

void ProxemicsLayer::updateBounds(double robot_x, double robot_y, double robot_yaw, double* min_x,
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

void ProxemicsLayer::removePeoplePointsAfterSomeTime(){
    int i = 0;
    while(i < timeToRemove.size()){
        //If time has passed - points will be removed
        if(ros::Time::now().toSec() >= timeToRemove[i]){
            peoplePoints.erase(peoplePoints.begin(), peoplePoints.begin() + pointsToRemove[i]);
            timeToRemove.erase(timeToRemove.begin());
            pointsToRemove.erase(pointsToRemove.begin());
        }
        else
            i++;
    }
}

//Use the person center point, and create 4 extra points that are slightly around the center (custom inflation)
vector<geometry_msgs::Point> ProxemicsLayer::calculateSurroundingPointsFromPersonCenter(geometry_msgs::Point center){
  vector<geometry_msgs::Point> points;

  vector<geometry_msgs::Point> circlePoints;// = createCircle(center, 0.15, 12); int size = circlePoints.size(); for(int i = 0; i < size; i++){points.push_back(circlePoints[i]);}
  //circlePoints = createCircle(center, 0.3, 18); size = circlePoints.size(); for(int i = 0; i < size; i++){points.push_back(circlePoints[i]);}
  //circlePoints = createCircle(center, 0.45, 24); size = circlePoints.size(); for(int i = 0; i < size; i++){points.push_back(circlePoints[i]);}
  circlePoints = createCircle(center, 1.1, 50); int size = circlePoints.size(); for(int i = 0; i < size; i++){points.push_back(circlePoints[i]);}





  points.push_back(center);
  return points;
}

vector<geometry_msgs::Point> ProxemicsLayer::createCircle(geometry_msgs::Point center, double radius, int amountOfPoints){
  vector<geometry_msgs::Point> points;
  geometry_msgs::Point newPoint = geometry_msgs::Point();
  double angleIncrement = 6.28 / amountOfPoints;
  double angle = 0;
  for(int i = 0; i < amountOfPoints; i++){
    newPoint.x = radius * cos(angle) + center.x;
    newPoint.y = radius * sin(angle) + center.y;
    angle = angle + angleIncrement; //Plus deg
    points.push_back(newPoint);
  }
  return points;
}


void ProxemicsLayer::updateCosts(costmap_2d::Costmap2D& master_grid, int min_i, int min_j, int max_i,
                                          int max_j)
{
  if (!enabled_)
    return;

  if(robotMoving == false)
    removePeoplePointsAfterSomeTime();

  unsigned int mx;
  unsigned int my;

  //Loop all people
  for(int i = 0; i < peoplePoints.size(); i++){
    //Create a small inflation around the person's center

    vector<geometry_msgs::Point> points = calculateSurroundingPointsFromPersonCenter(peoplePoints[i]);
    int size = points.size();
    //Add these points to the costmap
    for(int j = 0; j < size; j++){
      //ROS_INFO("Adding person point at (%f, %f)", points[j].x, points[j].y);
      if(master_grid.worldToMap(points[j].x, points[j].y, mx, my)){
        master_grid.setCost(mx, my, LETHAL_OBSTACLE);
      }
    }
  }
}


} // end namespace