#!/usr/bin/bash

if [[ -z "${LDS_MODEL}" ]]; then
    export LDS_MODEL="$(snapctl get lds-model)"
fi

if [[ -z "${TURTLEBOT3_MODEL}" ]]; then
    export TURTLEBOT3_MODEL="$(snapctl get turtlebot3-model)"
fi

if [[ -z "${TURTLEBOT3_SIMULATION}" ]]; then
    TURTLEBOT3_SIMULATION="$(snapctl get simulation)"
fi

roslaunch turtlebot3c_bringup turtlebot3c_bringup.launch simulation:=$TURTLEBOT3_SIMULATION
