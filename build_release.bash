#!/bin/bash

cd
cd autoware

colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Release