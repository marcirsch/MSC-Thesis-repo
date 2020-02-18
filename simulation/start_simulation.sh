
# Source ROS
source /opt/ros/melodic/setup.bash

# Build firmware
(cd Firmware && DONT_RUN=1 make px4_sitl_default gazebo)


#Exports from /Tools/setup_gazebo.bash
# Plugins are in build folder, that is not modified
export GAZEBO_PLUGIN_PATH=$GAZEBO_PLUGIN_PATH:$(pwd)/build/px4_sitl_default/build_gazebo
# Model is located in current folder
# export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:$(pwd)/models
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:$(pwd)/Firmware/Tools/sitl_gazebo/models
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$(pwd)/Firmware/build_gazebo

# Export from px4 webpage to start simulation
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$(pwd)
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$(pwd)/Firmware/Tools/sitl_gazebo

# Just in case
echo
echo "Environmental variables:"
printenv |grep ROS
printenv |grep GAZEBO
printenv |grep LD_
echo

(cd Firmware && roslaunch px4 mavros_posix_sitl.launch)
