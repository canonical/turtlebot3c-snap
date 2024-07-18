#!/usr/bin/bash
if [[ -z "${LDS_MODEL}" ]]; then
    export LDS_MODEL="$(snapctl get lds-model)"
fi

if [[ -z "${TURTLEBOT3_MODEL}" ]]; then
    export TURTLEBOT3_MODEL="$(snapctl get turtlebot3-model)"
fi

ros2 launch turtlebot3_bringup robot.launch.py
