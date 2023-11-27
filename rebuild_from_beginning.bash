#!/bin/bash

cd
cd autoware

rm -rf build/ install/ log/ src/

vcs import src < xrm_project.repos
vcs import src < calibration_tools.repos

colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=RelWithDebInfo