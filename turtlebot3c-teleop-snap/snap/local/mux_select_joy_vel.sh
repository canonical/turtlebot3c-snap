#!/usr/bin/bash

rosservice call /mux/select "/joy_vel"
exec $@
