#!/usr/bin/bash

TURTLEBOT3_MODEL="$(snapctl get turtlebot3-model)"

export TURTLEBOT3_MODEL

${SNAP}/opt/ros/noetic/bin/roslaunch turtlebot3c_2dnav turtlebot3c_mapping.launch

