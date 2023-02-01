#!/usr/bin/bash
if [ -f "${SNAP_USER_COMMON}/map/current_map.yaml" ]; then
  ${SNAP}/opt/ros/noetic/bin/roslaunch turtlebot3c_2dnav turtlebot3c_navigation.launch
else
  >&2 echo "File ${SNAP_USER_COMMON}/map/current_map.yaml does not exists." \
    "Have you run the mapping application?"
fi
