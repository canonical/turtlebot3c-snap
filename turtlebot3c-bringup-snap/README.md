# turtlebot3c-bringup

[![Snap Status](https://build.snapcraft.io/badge/canonical/turtlebot3c-snap.svg)](https://build.snapcraft.io/user/canonical/turtlebot3c-snap)

`turtlebot3c` is a collection of `launch` files and configuration files to ease working with the Turtlebot3.
The snaps are meant to be run with the real robot as well as the simulation, allowing one to quickly get an up and running Turtlebot3 application.

`turtlebot3c-bringup` is the core component of the robot as it handles all the drivers,
sensors, basic ROS nodes necessary for a functioning robot.
The snap launches a daemon that is automatically started upon installation and when the robot is turned on.
It starts the motor controller, advertises the sensors,
upload the robot model to the rosparam server and publishes the robot tf tree.
In other words, the robot is simply ready to be used at boot.

This snap is meant to run on the Turtlebot3 robot.

- See the [Turtlebot3 website](http://emanual.robotis.com/docs/en/platform/turtlebot3/overview/).
- See the [turtlebot3c repo](https://github.com/canonical/turtlebot3c).

## How to install

```terminal
sudo snap install turtlebot3c-bringup --channel=humble/latest
```

## Real robot setup

In case your Turtlebot doesn't use the default `LDS-01` lidar model change it with the help of

```bash
sudo snap set turtlebot3c lsd-model=LDS-02
```

## Robot model setup

By default the snap is using the Turtlebot3 model `waffle_pi`.
You can select another model (for the simulation or the real robot).
The available models are: `waffle_pi`, `waffle` and `burger`.
The model can change with the help of:

```bash
sudo snap set turtlebot3c turtlebot3-model=waffle_pi
```
