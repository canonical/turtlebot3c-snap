#!/usr/bin/bash

SIMULATION="$(snapctl get simulation)"
LDS_MODEL="$(snapctl get lds-model)"

export LDS_MODEL

${SNAP}/opt/ros/noetic/bin/roslaunch turtlebot3c_bringup turtlebot3c_bringup.launch simulation:=$SIMULATION
