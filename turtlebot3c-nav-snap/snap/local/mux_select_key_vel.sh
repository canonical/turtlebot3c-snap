#!/usr/bin/bash

rosservice call /mux/select "/key_vel"
exec $@
