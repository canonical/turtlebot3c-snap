#!/usr/bin/bash

rosservice call /mux/select "/nav_vel"
exec $@
