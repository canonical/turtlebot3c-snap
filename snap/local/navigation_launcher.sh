#!/usr/bin/bash

TURTLEBOT3_MODEL="$(snapctl get turtlebot3-model)"

export TURTLEBOT3_MODEL

if [ -f "${SNAP_USER_COMMON}/map/current_map.yaml" ]; then
  ${SNAP}/roslaunch turtlebot3c_2dnav turtlebot3c_navigation.launch
else
  >&2 echo "File ${SNAP_USER_COMMON}/map/current_map.yaml does not exist." \
    "Have you run the mapping application?"
fi

