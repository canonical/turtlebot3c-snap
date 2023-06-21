#!/usr/bin/bash

# Create map directory if it doesn't exist
mkdir -p ${SNAP_USER_COMMON}/map

rosrun map_server map_saver -f "${SNAP_USER_COMMON}/map/new_map"
