#!/usr/bin/bash

TURTLEBOT3_MODEL="$(snapctl get turtlebot3-model)"

export TURTLEBOT3_MODEL

${SNAP}/roslaunch turtlebot3c_2dnav turtlebot3c_mapping.launch

