#!/bin/bash

folder_path="/home/ubuntu/snaps"

# Change to the specified folder
cd "$folder_path" || exit

# Iterate through each file in the folder
for file in *; do
    # Check if it is a regular file
    if [ -f "$file" ]; then
        # Execute the command with the name of the file
        snap install "$file" --dangerous
    fi
done

sudo snap connect turtlebot3c-bringup:ros-noetic ros-noetic-robot
sudo snap connect turtlebot3c-nav:ros-noetic ros-noetic-robot
sudo snap connect turtlebot3c-teleop:ros-noetic ros-noetic-robot

## Install ROS
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

sudo apt install curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
sudo apt update
sudo apt install ros-noetic-desktop-full
sudo apt install ros-noetic-turtlebot3-gazebo

source /opt/ros/noetic/setup.sh

## set gui arg to false
sed -i "s/\(<arg name=\"gui\" value=\"\).*\(\"\/>\)/\1false\2/" /opt/ros/noetic/share/turtlebot3_gazebo/launch/turtlebot3_empty_world.launch
## Launch turtlebot simulation
TURTLEBOT3_MODEL=waffle_pi roslaunch turtlebot3_gazebo turtlebot3_empty_world.launch &
pid=$!

sudo snap set turtlebot3c-bringup simulation=true

sleep 5

check_existence() {
    local topic_or_node=$1
    local name=$2
    local timeout=$3
    local start_time=$(date +%s)
    while true; do
        $topic_or_node list | grep -q "/$name"
        if [ $? -eq 0 ]; then
            echo "$name is running."
            return 0
        fi
        local current_time=$(date +%s)
        local elapsed_time=$((current_time - start_time))
        if [ $elapsed_time -ge $timeout ]; then
            echo "Error $name is not running."
            sudo snap stop turtlebot3c
            killall -9 rosmaster
            exit 1
        fi
        sleep 1
    done
}

## test core robot_state_publisher
check_existence rosnode robot_state_publisher

## test mapping node
sudo snap start turtlebot3c-nav.mapping
check_existence rosnode turtlebot3_slam_gmapping 10
check_existence rostopic map 10
sudo snap stop turtlebot3c-nav.mapping

## test navigation node
sudo snap start turtlebot3c-nav.navigation
check_existence rosnode move_base 10
check_existence rostopic nav_vel 10
sudo snap start turtlebot3c-nav.navigation

kill $pid
sudo snap stop turtlebot3c-bringup
killall -9 rosmaster
