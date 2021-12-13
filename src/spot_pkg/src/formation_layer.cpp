#include <spot_pkg/formation_layer.h>
#include <pluginlib/class_list_macros.h>
#include <geometry_msgs/Point.h>
#include <vector>


using namespace std;

PLUGINLIB_EXPORT_CLASS(formation_layer_namespace::FormationLayer, costmap_2d::Layer)

using costmap_2d::LETHAL_OBSTACLE;

namespace formation_layer_namespace
{

FormationLayer::FormationLayer() {}   

void FormationLayer::formationCallback(const spot_pkg::formationPoints::ConstPtr& msg){
  //ROS_INFO("Receiving points from formation callback");
  int size = msg->points.size();
  //ROS_INFO("Amount of points: %i", size);
  //Loop all f-formation points
  for(int i = 0; i < size; i++){

    geometry_msgs::Point newPoint = geometry_msgs::Point();
    newPoint.x = msg->points[i].x;
    newPoint.y = msg->points[i].y;

    costmapPoints.push_back(calculatePointRelativeToRobot(newPoint));
    //ROS_INFO("newPoint (%f, %f)", newPoint.x, newPoint.y);    
    //ROS_INFO("calculatedPoint (%f, %f)", calculatePointRelativeToRobot(newPoint).x, calculatePointRelativeToRobot(newPoint).y);  
  }

   // ROS_INFO("Time Now: %f", ros::Time::now().toSec());
    timeToRemove.push_back(ros::Time::now().toSec() + pointTimer);
   // ROS_INFO("Time After 5 Seconds: %f", ros::Time::now().toSec() + pointTimer);
    pointsToRemove.push_back(size);
    //ROS_INFO("Points to remove: %d", size);

}


geometry_msgs::Point FormationLayer::calculatePointRelativeToRobot(geometry_msgs::Point point){
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

void FormationLayer::onInitialize()
{
  current_ = true;
  sub = nh.subscribe("/formations", 1000, &FormationLayer::formationCallback, this);

  dsrv_ = new dynamic_reconfigure::Server<costmap_2d::GenericPluginConfig>(nh);
  dynamic_reconfigure::Server<costmap_2d::GenericPluginConfig>::CallbackType cb = boost::bind(
      &FormationLayer::reconfigureCB, this, _1, _2);
  dsrv_->setCallback(cb);

}

void FormationLayer::reconfigureCB(costmap_2d::GenericPluginConfig &config, uint32_t level)
{
  enabled_ = config.enabled;
}

void FormationLayer::updateBounds(double robot_x, double robot_y, double robot_yaw, double* min_x,
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

void FormationLayer::removeCostmapPointsAfterSomeTime(){
    int i = 0;
    while(i < timeToRemove.size()){
        //ROS_INFO("Index: %i", i);
        //If time has passed - points will be removed
        if(ros::Time::now().toSec() >= timeToRemove[i]){
            //ROS_INFO("Removing points index[%d] Time now: %f", i, ros::Time::now().toSec());  
            //Remove specific AMOUNT of points from costmapPoints
            costmapPoints.erase(costmapPoints.begin(), costmapPoints.begin() + pointsToRemove[i]);
            //ROS_INFO("Removing number of points: %d", pointsToRemove[i]);
            //Remove time and number
            timeToRemove.erase(timeToRemove.begin());
            pointsToRemove.erase(pointsToRemove.begin());
        }
        else
            i++;
    }
    //ROS_INFO("END");
    //int size = costmapPoints.size();
    //ROS_INFO("costmap size %i", size);
}

void FormationLayer::updateCosts(costmap_2d::Costmap2D& master_grid, int min_i, int min_j, int max_i,
                                          int max_j)
{
  if (!enabled_)
    return;

  removeCostmapPointsAfterSomeTime();

  unsigned int mx;
  unsigned int my;

  for(int i = 0; i < costmapPoints.size(); i++){
    
    if(master_grid.worldToMap(costmapPoints[i].x, costmapPoints[i].y, mx, my)){
      master_grid.setCost(mx, my, LETHAL_OBSTACLE);
      //ROS_INFO("RobotPoint: (%f, %f), formationPoint: (%f, %f), yaw: %f", xRobot, yRobot, costmapPoints[i].x, costmapPoints[i].y, yawRobot);
    }
  }
}


} // end namespace