# turtlebot3c-nav

[![Snap Status](https://build.snapcraft.io/badge/canonical/turtlebot3c-snap.svg)](https://build.snapcraft.io/user/canonical/turtlebot3c-snap)

`turtlebot3c` is a collection of `launch` files and configuration files to ease working with the Turtlebot3.
The snaps are meant to be run with the real robot as well as the simulation, allowing one to quickly get an up and running Turtlebot3 application.

`turtlebot3c-nav` snap contains both the mapping and the navigation applications.
They can be started and stopped from the command line.
Furthermore, switching from mapping to navigation can be done seamlessly since the navigation will automatically pick-up the last map created by the mapping.

- See the [Turtlebot3 website](http://emanual.robotis.com/docs/en/platform/turtlebot3/overview/).
- See the [turtlebot3c repo](https://github.com/canonical/turtlebot3c).

## How to install

```terminal
sudo snap install turtlebot3c-nav --channel=noetic/latest
```

## Robot model setup

By default the snap is using the Turtlebot3 model `waffle_pi`.
You can select another model (for the simulation or the real robot).
The available models are: `waffle_pi`, `waffle` and `burger`.
The model can change with the help of:

```bash
sudo snap set turtlebot3c-nav turtlebot3-model=waffle_pi
```

## How to use

### mapping

The `mapping` app is a daemon that allows the robot to build a representation of its environment as a map usable by the navigation stack.
To launch the mapping, simply type the following command:

```terminal
sudo snap start turtlebot3c-nav.mapping
```

Drive your robot around in order to map your environment.
Notice that you can monitor the process through Rviz.
Once the entire environment covered, stop the mapping by typing the following command:

```terminal
sudo snap stop turtlebot3c-nav.mapping
```

This will stop the process and automatically save the map as
`$SNAP_USER_COMMON/map/${DATE}.yaml`.
Furthermore, a softlink to the newly created map is created at
`$SNAP_USER_COMMON/map/current_map.yaml`.
The `navigation` stack will automatically use the softlinked map.
This command automatically select 'key_vel' as the input for the [mux](http://wiki.ros.org/topic_tools/mux) node.

Note that the default `USER` of snap daemons is `root`.
Hence, the `$SNAP_USER_COMMON` variable will point to `/root/snap/turtlebot3c/common`.

### navigation

The `navigation` app is also a daemon that encompasses the whole autonomous navigation stack.
It allows the robot to move autonomously in its environment,
from its current location to a desired goal while avoiding obstacles.
To start the navigation app, simply type the following command:

```terminal
sudo snap start turtlebot3c.navigation
```

It will start the whole navigation stack and use the last map built with the
`mapping` app found at `$SNAP_USER_COMMON/map`.
This command automatically select 'nav_vel' as the input for the [mux](http://wiki.ros.org/topic_tools/mux) node and switch back to 'key_vel' on exit.
You can stop it by typing:

```terminal
sudo snap stop turtlebot3c.navigation
```
