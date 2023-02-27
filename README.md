# Snappy turtlebot3c

[![Snap Status](https://build.snapcraft.io/badge/canonical/turtlebot3c-snap.svg)](https://build.snapcraft.io/user/canonical/turtlebot3c-snap)

`turtlebot3c` packaged as a snap.  
`turtlebot3c` is a collection of `launchfiles` and configuration files to ease working with the Turtlebot3.
The snap is meant to be run with the real robot as well as the simulation, allowing one to quickly get an up and running Turtlebot3 application.

- See the [Turtlebot3 website](http://emanual.robotis.com/docs/en/platform/turtlebot3/overview/).
- See the [turtlebot3c repo](https://github.com/canonical/turtlebot3c).

## How to install

```terminal
sudo snap install turtlebot3c --channel=noetic/latest
```
## Real robot setup
In case your turtlebot doesn't use the default `LDS-01` lidar model change it with the help of
```
sudo snap set turtlebot3c lsd-model=LDS-02
```

## Simulation setup
First select the simulation mode of `turtlebot3c`:
```bash
sudo snap set turtlebot3c simulation=true
```
Then, launch the simulation:
```bash
TURTLEBOT3_MODEL=waffle_pi roslaunch turtlebot3_gazebo turtlebot3_world.launch
```

## How to use

The snap is composed of 5 applications:
- core
- teleop
- key
- joy
- mapping
- navigation

### core
The `core` app is a daemon that is automatically started when the robot is turned on.
It starts the motor controller, advertises the sensors, upload the robot model to the rosparam server and publishes the robot tf tree.
In case the simulation is used, it only starts the `robot_state_publisher` since the robot is meant to be spawned by the simulation.
At boot, the robot is simply ready to be used.

### teleop
The `teleop` app is a daemon that is automatically started when the robot is turned on.
It allows for controlling the robot from multiple sources such as the keyboard (e.g. [key_teleop](http://wiki.ros.org/key_teleop)),
a remote controller (e.g. [joy_teleop](http://wiki.ros.org/joy_teleop)) or leave it to the navigation stack.
The input to use is managed by the [mux](http://wiki.ros.org/topic_tools/mux) node. It can be changed through a rosservice call such as,
```terminal
rosservice call /mux/select "topic: 'joy_vel'"
```

### key
The `key` app allows the keyboard to control the robot.
See also the `teleop` application for further details.

To start the app, simply type the following command,
```terminal
turtlebot3c.key
```
This command automatically select 'key_vel' as the input for the [mux](http://wiki.ros.org/topic_tools/mux) node.

### joy
The `joy` app allows the joystick to control the robot.
See also the `teleop` application for further details.

To start the app, simply type the following command,
```terminal
turtlebot3c.joy
```
This command automatically select 'joy_vel' as the input for the [mux](http://wiki.ros.org/topic_tools/mux) node.

### mapping
The `mapping` app is a daemon that allows the robot to build a representation of its environment as a map usable by the navigation stack.
To launch the mapping, simply type the following command:
```terminal
sudo snap start turtlebot3c.mapping
```
Drive your robot around in order to map your environment.
Notice that you can monitor the process through Rviz.
Once the entire environment covered, stop the mapping by typing the following command:
```terminal
sudo snap stop turtlebot3c.mapping
```
This will stop the process and automatically save the map as
`$SNAP_USER_COMMON/map/${DATE}.yaml`.
Furthermore, a softlink to the newly created map is created at
`$SNAP_USER_COMMON/map/current_map.yaml`. The `navigation` stack will automatically use the softlinked map.
This command automatically select 'key_vel' as the input for the [mux](http://wiki.ros.org/topic_tools/mux) node.

Note that the default `USER` of snap daemons is `root`. Hence, the `$SNAP_USER_COMMON` variable will point to `/root/snap/turtlebot3c/common`.

### navigation
The `navigation` app is also a daemon that encompasses the whole autonomous navigation stack.
It allows the robot to move autonomously in its environment, from its current location to a desired goal while avoiding obstacles.
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

