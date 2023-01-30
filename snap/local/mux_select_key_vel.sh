#!/usr/bin/bash
$SNAP/opt/ros/noetic/bin/rosservice call /mux/select "/key_vel"
exec $@
