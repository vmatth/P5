//Hello!
//HI!

#include "ros/ros.h"
#include <std_srvs/Trigger.h>
#include <geometry_msgs/Pose.h>
#include <geometry_msgs/Twist.h>
#include <geometry_msgs/PoseStamped.h>
#include <move_base_msgs/MoveBaseAction.h>
#include <move_base_msgs/MoveBaseGoal.h>
#include <actionlib/client/simple_action_client.h>

typedef actionlib::SimpleActionClient<move_base_msgs::MoveBaseAction> MoveBaseClient;

void estop_release(){
    ROS_INFO("Release Handbrake");
    ros::NodeHandle n;
    ros::ServiceClient client = n.serviceClient<std_srvs::Trigger>("/spot/estop/release");

    //trigger
    std_srvs::Trigger serviceEstopRelease;  

    if(client.call(serviceEstopRelease)){//Call power_on service
        ROS_INFO("Service EStopRelease response: %d", serviceEstopRelease.response.success);
        ROS_INFO("Message output: %s", serviceEstopRelease.response.message.c_str());
    }
    else{
        ROS_ERROR("Error, SPOT couldnt release:/");
    }
}

void power_on(){
    ROS_INFO("Power On Function");
    ros::NodeHandle n;
    ros::ServiceClient client = n.serviceClient<std_srvs::Trigger>("/spot/power_on");

    //trigger
    std_srvs::Trigger servicePowerOn;  

    if(client.call(servicePowerOn)){//Call power_on service
        ROS_INFO("Service power on response: %d", servicePowerOn.response.success);
        ROS_INFO("Message output: %s", servicePowerOn.response.message.c_str());
    }
    else{
        ROS_ERROR("Error, SPOT couldnt power on :/");
    }
}

void power_off(){
    ROS_INFO("Power Off Function");
    ros::NodeHandle n;
    ros::ServiceClient client = n.serviceClient<std_srvs::Trigger>("/spot/power_off");

    //trigger
    std_srvs::Trigger servicePowerOn;  

    if(client.call(servicePowerOn)){//Call power_on service
        ROS_INFO("Service power on response: %d", servicePowerOn.response.success);
        ROS_INFO("Message output: %s", servicePowerOn.response.message.c_str());
    }
    else{
        ROS_ERROR("Error, SPOT couldnt power off :/");
    }
}
  
void stand(){
    ROS_INFO("Stand Function");
    ros::NodeHandle n;
    ros::ServiceClient client = n.serviceClient<std_srvs::Trigger>("/spot/stand");

    //trigger
    std_srvs::Trigger serviceStand;  

    if(client.call(serviceStand)){//Call stand service
        ROS_INFO("Service stand response: %d", serviceStand.response.success);
        ROS_INFO("Message output: %s", serviceStand.response.message.c_str());
    }
    else{
        ROS_ERROR("Error, SPOT couldnt stand :/");
    }   
}

void sit(){
    ROS_INFO("Sit Function");
    ros::NodeHandle n;
    ros::ServiceClient client = n.serviceClient<std_srvs::Trigger>("/spot/sit");

    //trigger
    std_srvs::Trigger serviceSit;  

    if(client.call(serviceSit)){ //Call stand service
        ROS_INFO("Service sit response: %d", serviceSit.response.success);
        ROS_INFO("Message output: %s", serviceSit.response.message.c_str());
    }
    else{
        ROS_ERROR("Error, SPOT couldnt sit :/");
    }   
}

void orientCallback(const geometry_msgs::Pose::ConstPtr& msg){
    //ROS_INFO("SPOT is located at: \n x=[%f], y=[%f], z=[%f]", msg->position.x, msg->position.y, msg->position.z);
    ROS_INFO("SPOT is oriented at: \n x=[%f], y=[%f], z=[%f], w=[%f]", msg->orientation.x, msg->orientation.y, msg->orientation.z, msg->orientation.w);
}

void velCallback(const geometry_msgs::Twist::ConstPtr& msg){
    ROS_INFO("SPOT is moving with velocity: \n x=[%f], y=[%f], z=[%f]", msg->linear.x, msg->linear.y, msg->linear.z);
}

void goalCallback(const geometry_msgs::PoseStamped::ConstPtr& msg){
    ROS_INFO("Current Goal is: \n x=[%f], y=[%f], z=[%f]", msg->pose.position.x, msg->pose.position.y, msg->pose.position.z);
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "stand_sit_node");
    ros::NodeHandle n;

    ros::Subscriber orientSub = n.subscribe("/spot/body_pose", 1000, orientCallback);
    ros::Subscriber velSub = n.subscribe("/spot/cmd_vel",1000,velCallback);
    ros::Subscriber goalSub = n.subscribe("/move_base_simple/goal",1000,goalCallback);

    //ros::Publisher goalPub = n.advertise<geometry_msgs::PoseStamped>("move_base_simple/goal",1000);

    estop_release();
    ros::Duration(2.0).sleep();
    power_on();
    stand();
    
// ///////////////////////////////////////////////////////////////////////////
// MOVE BASE CLIENT///////////////////////////////////////////////////////////
// ///////////////////////////////////////////////////////////////////////////
    MoveBaseClient ac("move_base", true);
    while(!ac.waitForServer(ros::Duration(5.0))){
        ROS_INFO("Waiting for the move_base action server to come up");
    }
    move_base_msgs::MoveBaseGoal goal;

    //we'll send a goal to the robot to move 1 meter forward
    goal.target_pose.header.frame_id = "base_link";
    goal.target_pose.header.stamp = ros::Time::now();

    goal.target_pose.pose.position.x = 1.0;
    goal.target_pose.pose.orientation.w = 1.0;

    ROS_INFO("Sending goal");
    ac.sendGoal(goal);

    ac.waitForResult();

    if(ac.getState() == actionlib::SimpleClientGoalState::SUCCEEDED)
        ROS_INFO("Hooray, the base moved 1 meter forward");
    else
        ROS_INFO("The base failed to move forward 1 meter for some reason");    
// //////////////////////////////////////////////////////////////////////////////
// MOVE BASE CLIENT END//////////////////////////////////////////////////////////
// //////////////////////////////////////////////////////////////////////////////

/*
    while(ros::ok()){
        geometry_msgs::PoseStamped goalmsg;
        goalmsg.pose.position.x = 1;
        goalmsg.pose.position.y = 0;
        goalmsg.pose.position.z = 0;
        goalPub.publish(goalmsg);
        //ROS_INFO("x=[%f]",goalmsg.pose.position.x);
    }
*/

    ros::Duration(5.0).sleep();
    sit();
    ros::Duration(1.0).sleep();
    power_off();
    ros::spin();

    return 0;
}


