#!/usr/bin/bash
$SNAP/opt/ros/noetic/bin/rosservice call /mux/select "/nav_vel"
exec $@

