#!/usr/bin/bash
$SNAP/opt/ros/noetic/bin/rosservice call /mux/select "/joy_vel"
exec $@

