# Snappy turtlebot3c

[![Snap Status](https://build.snapcraft.io/badge/canonical/turtlebot3c-snap.svg)](https://build.snapcraft.io/user/canonical/turtlebot3c-snap)

`turtlebot3c` packaged as a snap.  
`turtlebot3c` is a collection of `launchfiles` and configuration files to ease working with the Turtlebot3.
The snap is meant to be run on the robot, allowing one to quickly get up and running with a self contained Turtlebot3.

- See the [Turtlebot3 website](http://emanual.robotis.com/docs/en/platform/turtlebot3/overview/).
- See the [turtlebot3c repo](https://github.com/canonical/turtlebot3c).

## How to install

```terminal
sudo snap install turtlebot3c
```

## How to use

The snap is composed of 5 applications:
- core
- teleop
- joy
- mapping
- navigation

### core
The `core` app is a daemon that is automatically started when the robot is turned on.
It starts the motor controller, advertises the sensors, upload the robot model to the rosparam server and publishes the robot tf tree.
At boot, the robot is simply ready to be used.

### teleop
The `teleop` app is a daemon that is automatically started when the robot is turned on.
It allows for controlling the robot from multiple sources such as the keyboard (e.g. [key_teleop](http://wiki.ros.org/key_teleop)),
a remote controller (e.g. [joy_teleop](http://wiki.ros.org/joy_teleop)) or leave it to the navigation stack.
The input to use is managed by the [mux](http://wiki.ros.org/topic_tools/mux) node. It can be changed through a rosservice call such as,
```terminal
rosservice call /mux/select "topic: 'joy_vel'"
```

### joy
The `joy` app allows for connecting a (third party) remote controller directly to the robot in order to drive it.
See also the `teleop` application for further details.

To start the app, simply type the following command,
```terminal
turtlebot3c.joy
```

### mapping
The `mapping` app allows the robot to build a representation of its environment as a map usable by the navigation stack.
To launch the mapping, simply type the following command:
```terminal
turtlebot3c.mapping
```
Drive your robot around in order to map your environment.
Notice that you can monitor the process through Rviz.
Once the entire environment covered, stop the mapping by pressing `ctrl+c`.
This will stop the process and automatically save the map as
`$SNAP_USER_DATA/.tb3c/maps/<date_and_time>/map.yaml`.
Furthermore, a softlink to the newly created map is created at
`$SNAP_USER_DATA/.tb3c/maps/config`. The `navigation` stack will automatically use the softlinked map.

### navigation
The `navigation` app encompasses the whole autonomous navigation stack.
It allows the robot to move autonomously in its environment, from its current location to a desired goal while avoiding obstacles.
To start the navigation app, simply type the following command:
```terminal
turtlebot3c.navigation
```
It will start the whole navigation stack and use the last map built with the
`mapping` app found at `$SNAP_USER_DATA/.tb3c/maps/config`.
