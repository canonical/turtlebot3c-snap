#!/usr/bin/bash
set -e

# backup our map with the date and time
DATE=`date +%Y%m%d-%H-%M-%S`
mv ${SNAP_USER_COMMON}/new_map.yaml ${SNAP_USER_COMMON}/$DATE.yaml
sed -i "s/new_map.pgm/$DATE.pgm/" ${SNAP_USER_COMMON}/$DATE.yaml
mv ${SNAP_USER_COMMON}/new_map.pgm ${SNAP_USER_COMMON}/$DATE.pgm

# create symlink to use the map
rm -f ${SNAP_USER_COMMON}/current_map.yaml
ln -s ${SNAP_USER_COMMON}/$DATE.yaml ${SNAP_USER_COMMON}/current_map.yaml
