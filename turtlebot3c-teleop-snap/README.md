# turtlebot3c-teleop

[![Snap Status](https://build.snapcraft.io/badge/canonical/turtlebot3c-snap.svg)](https://build.snapcraft.io/user/canonical/turtlebot3c-snap)

`turtlebot3c` is a collection of `launch` files and configuration files to ease working with the Turtlebot3.
The snaps are meant to be run with the real robot as well as the simulation, allowing one to quickly get an up and running Turtlebot3 application.

`turtlebot3c-teleop` snap allows for controlling the robot from multiple sources such as the keyboard (e.g. [key_teleop](http://wiki.ros.org/key_teleop)),
a remote controller (e.g. [joy_teleop](http://wiki.ros.org/joy_teleop)) or leave it to the navigation stack.
The input to use is managed by the [mux](http://wiki.ros.org/topic_tools/mux) node.
It automatically launches a daemon upon installation or when the robot is turned on.

- See the [Turtlebot3 website](http://emanual.robotis.com/docs/en/platform/turtlebot3/overview/).
- See the [turtlebot3c repo](https://github.com/canonical/turtlebot3c).

## How to install

```terminal
sudo snap install turtlebot3c-teleop --channel=noetic/latest
```

## Robot model setup

By default the snap is using the Turtlebot3 model `waffle_pi`.
You can select another model (for the simulation or the real robot).
The available models are: `waffle_pi`, `waffle` and `burger`.
The model can change with the help of:

```bash
sudo snap set turtlebot3c-teleop turtlebot3-model=waffle_pi
```

## How to use

The [mux](http://wiki.ros.org/topic_tools/mux) input to be uses can be changed through a `rosservice` call such as,

```terminal
rosservice call /mux/select "topic: 'joy_vel'"
```

### Apps

#### key

The `key` app allows the keyboard to control the robot.
See also the `teleop` application for further details.

To start the app, simply type the following command,

```terminal
turtlebot3c-teleop.key
```

This command automatically select 'key_vel' as the input for the [mux](http://wiki.ros.org/topic_tools/mux) node.

#### joy

The `joy` app allows the joystick to control the robot.
See also the `teleop` application for further details.

To start the app, simply type the following command,

```terminal
turtlebot3c.joy
```

This command automatically select 'joy_vel' as the input for the [mux](http://wiki.ros.org/topic_tools/mux) node.
