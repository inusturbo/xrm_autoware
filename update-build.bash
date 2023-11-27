#!/bin/bash

cd
cd autoware

git pull https://github.com/inusturbo/xrm_autoware.git main

vcs import src < xrm_project.repos
vcs import src < calibration_tools.repos
vcs pull src

bash set_swap.bash

source install/setup.bash
rosdep install -y --from-paths src --ignore-src --rosdistro $ROS_DISTRO

colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=RelWithDebInfo