#!/usr/bin/bash

SIMULATION="$(snapctl get simulation)"
LDS_MODEL="$(snapctl get lds-model)"
TURTLEBOT3_MODEL="$(snapctl get turtlebot3-model)"

export LDS_MODEL
export TURTLEBOT3_MODEL

ros2 launch turtlebot3_bringup robot.launch.py use_sim_time:=$SIMULATION
