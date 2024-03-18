#!/usr/bin/bash

SIMULATION="$(snapctl get simulation)"
LDS_MODEL="$(snapctl get lds-model)"
TURTLEBOT3_MODEL="$(snapctl get turtlebot3-model)"

export LDS_MODEL
export TURTLEBOT3_MODEL

${SNAP}/roslaunch turtlebot3c_bringup turtlebot3c_bringup.launch simulation:=$SIMULATION

