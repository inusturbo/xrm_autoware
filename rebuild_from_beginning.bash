#!/bin/bash

cd
cd autoware

rm -rf build/ install/ log/ src/

mkdir src

bash set_swap.bash

vcs import src < xrm_project.repos
vcs import src < calibration_tools.repos

source /opt/ros/humble/setup.bash
rosdep install -y --from-paths src --ignore-src --rosdistro $ROS_DISTRO

cd
cd autoware/src/sensor_component/external/xrm_rslidar_sdk
git submodule init
git submodule update
sudo apt-get install -y libyaml-cpp-dev
sudo apt-get install -y  libpcap-dev
sudo apt-get install -y libqt5serialport5-dev
rosdep update
pip3 install pyserial

cd
cd autoware
source /opt/ros/humble/setup.bash
colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=RelWithDebInfo