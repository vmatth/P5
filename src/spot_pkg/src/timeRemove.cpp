#include "ros/ros.h"
#include "std_msgs/String.h"
#include <spot_pkg/formationPoints.h>
#include <geometry_msgs/Point.h>
#include <vector>

using namespace std;

vector<geometry_msgs::Point> costmapPoints; //Points stored in the costmap. Points here will be removed after 1 second.
vector<double> timeToRemove; //Each index contains the TIME when to remove points from costmapPoints
vector<int> pointsToRemove; //Each index contains the AMOUNT of points to remove from costmapPoints

void formationCallback(const spot_pkg::formationPoints::ConstPtr& msg){
  ROS_INFO("Receiving points from formation callback");
  int size = msg->points.size();
  ROS_INFO("Amount of points: %i", size);
  //Loop all f-formation points
  //formationPoints.clear(); //Kan fjernes
  for(int i = 0; i < size; i++){

    geometry_msgs::Point newPoint = geometry_msgs::Point();
    newPoint.x = msg->points[i].x;
    newPoint.y = msg->points[i].y;

    costmapPoints.push_back(newPoint);
    //formationPoints.push_back(newPoint); //Kan fjernes
  }

    ROS_INFO("Time Now: %f", ros::Time::now().toSec());
    timeToRemove.push_back(ros::Time::now().toSec() + 5.0);
    ROS_INFO("Time After 5 Seconds: %f", ros::Time::now().toSec() + 5.0);
    pointsToRemove.push_back(size);
    ROS_INFO("Points to remove: %d", size);
}

void removeCostmapPointsAfterSomeTime(){
    int i = 0;
    while(i < timeToRemove.size()){
        ROS_INFO("Index: %i", i);
        //If time has passed - points will be removed
        if(ros::Time::now().toSec() >= timeToRemove[i]){
            ROS_INFO("Removing points index[%d] Time now: %f", i, ros::Time::now().toSec());  
            //Remove specific AMOUNT of points from costmapPoints
            costmapPoints.erase(costmapPoints.begin(), costmapPoints.begin() + pointsToRemove[i]);
            ROS_INFO("Removing number of points: %d", pointsToRemove[i]);
            //Remove time and number
            timeToRemove.erase(timeToRemove.begin());
            pointsToRemove.erase(pointsToRemove.begin());
        }
        else
            i++;
    }
    ROS_INFO("END");
    int size = costmapPoints.size();
    ROS_INFO("costmap size %i", size);
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "talker");

    ros::NodeHandle n;
    ros::Subscriber sub = n.subscribe("/formations", 1000, formationCallback);


  ros::Rate loop_rate(10);
  int count = 0;
  while (ros::ok())
  {
    removeCostmapPointsAfterSomeTime();
    ros::spinOnce();

    loop_rate.sleep();
  }

    return 0;
}
