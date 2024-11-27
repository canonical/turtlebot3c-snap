#!/usr/bin/bash

SIMULATION="$(snapctl get simulation)"
TURTLEBOT3_MODEL="$(snapctl get turtlebot3-model)"

export TURTLEBOT3_MODEL

${SNAP}/opt/ros/noetic/bin/roslaunch turtlebot3c_bringup turtlebot3c_bringup.launch simulation:=$SIMULATION

