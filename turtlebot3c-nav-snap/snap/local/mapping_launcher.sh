#!/usr/bin/bash

if [[ -z "${TURTLEBOT3_MODEL}" ]]; then
  export TURTLEBOT3_MODEL="$(snapctl get turtlebot3-model)"
fi

$SNAP/roslaunch turtlebot3c_2dnav turtlebot3c_mapping.launch
