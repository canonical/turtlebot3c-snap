#!/usr/bin/bash

# make map directory if not existing
mkdir -p ${SNAP_USER_COMMON}/map

$SNAP/opt/ros/noetic/bin/rosrun map_server map_saver -f "${SNAP_USER_COMMON}/map/new_map"

