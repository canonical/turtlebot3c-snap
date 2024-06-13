#!/usr/bin/bash

ROS_MASTER_HOST="$(snapctl get ros-master-host)"

if [ "${ROS_MASTER_URI}" == "http://localhost:11311" ]; then
    export ROS_MASTER_URI=http://${ROS_MASTER_HOST}:11311
fi

if [[ -z "${ROS_HOSTNAME}" ]]; then
    export ROS_HOSTNAME=${ROS_MASTER_HOST}
fi

exec $@
