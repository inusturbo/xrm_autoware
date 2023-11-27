#!/bin/bash

cd
cd autoware

rm -rf build/ install/ log/ src/

mkdir src

bash set_swap.bash

vcs import src < xrm_project.repos
vcs import src < calibration_tools.repos

source /opt/ros/humble/setup.bash

cd
cd autoware/src/sensor_component/external/xrm_rslidar_sdk
git submodule init
git submodule update
sudo apt-get install -y libyaml-cpp-dev
sudo apt-get install -y  libpcap-dev

colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=RelWithDebInfo