#!/usr/bin/bash

# path	to the last map
CURRENT_MAP=$(readlink -f /root/snap/turtlebot3c/common/map/current_map.yaml)
# get the list of YAML files older than a month except for the current map
#LIST_OF_FILES=$(find $SNAP_USER_COMMON/map -maxdepth 1 -type f -mtime +30 -name "*.yaml" ! -path $CURRENT_MAP)
LIST_OF_FILES=$(find $SNAP_USER_COMMON/map -maxdepth 1 -type f -name "*.yaml" ! -path $CURRENT_MAP)

# delete the yaml files
rm -f $LIST_OF_FILES
# delete the associated pgm
echo $LIST_OF_FILES | sed 's/yaml/pgm/' | xargs rm -f

