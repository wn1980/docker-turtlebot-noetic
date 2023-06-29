#!/usr/bin/env bash

set -e

source /opt/ros/$ROS_DISTRO/setup.bash

sudo apt-get update && \
sudo apt-get upgrade -y && \
sudo apt-get install -y \
    ros-${ROS_DISTRO}-compressed-image-transport \
    ros-${ROS_DISTRO}-camera-info-manager \
    libraspberrypi0 \
    libraspberrypi-dev

mkdir -p ~/catkin_ws/src && cd ~/catkin_ws/src

if [ ! -d "raspicam_node" ]; then
    git clone https://github.com/UbiquityRobotics/raspicam_node.git
fi

cd ~/catkin_ws && catkin_make

sudo usermod -aG video $USER