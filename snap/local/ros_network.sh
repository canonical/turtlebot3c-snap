#!/usr/bin/bash

ROS_MASTER_HOST="$(snapctl get ros-master-host)"

if [[ -z "${ROS_MASTER_URI}" ]]; then
    export ROS_MASTER_URI=http://${ROS_MASTER_HOST}:11311
fi
export ROS_IP=${ROS_MASTER_HOST}

exec $@

