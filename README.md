# Snappy turtlebot3c

[![Snap Status](https://build.snapcraft.io/badge/canonical/turtlebot3c-snap.svg)](https://build.snapcraft.io/user/canonical/turtlebot3c-snap)

`turtlebot3c` packaged as snaps.
`turtlebot3c` is a collection of `launchfiles` and configuration files to ease working with the Turtlebot3.
The snaps are meant to be run with the real robot as well as the simulation, allowing one to quickly get an up and running Turtlebot3 application.

- See the [Turtlebot3 website](http://emanual.robotis.com/docs/en/platform/turtlebot3/overview/).
- See the [turtlebot3c repo](https://github.com/canonical/turtlebot3c).

The project is composed of three snaps,

- [`turtlebot3c-bringup`](./turtlebot3c-bringup-snap/README.md) is the core component of the robot as it handles all the drivers, sensors, basic ROS nodes necessary for a functioning robot.
- [`turtlebot3c-teleop`](./turtlebot3c-teleop-snap/README.md) allows for teleoperating the robot.
  It is composed of a multiplexer for the command sources together with a joy and a keyboard teleop apps.
- [`turtlebot3c-nav`](./turtlebot3c-nav-snap/README.md) contains two applications that are, mapping and navigation.
