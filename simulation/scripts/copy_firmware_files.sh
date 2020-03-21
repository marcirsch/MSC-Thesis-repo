#!/bin/bash
SIMULATION_FOLDER="$1"
echo "Simulation folder: $SIMULATION_FOLDER"

FIRMWARE_FOLDER="$SIMULATION_FOLDER/Firmware"
FIRMWARE_FILES="$SIMULATION_FOLDER/firmware_files"

echo "Firmware folder: $FIRMWARE_FOLDER"
echo "Firmware files to copy: $FIRMWARE_FILES"

# Copy everything from launch folder to Firmware/launch
echo "Copying launch files"
cp -avr $FIRMWARE_FILES/launch/* $FIRMWARE_FOLDER/launch
# Copy model folders 
echo "Copying model files"
cp -avr $FIRMWARE_FILES/models/* $FIRMWARE_FOLDER/Tools/sitl_gazebo/models/
# Overwrite cmake file
echo "Copying platform file"
cp -avr $FIRMWARE_FILES/platforms/sitl_target.cmake $FIRMWARE_FOLDER/platforms/posix/cmake/
# Copy ROMFS file
echo "Copying ROMFS file"
cp -avr $FIRMWARE_FILES/ROMFS/4029_iris_vl53l1x $FIRMWARE_FOLDER/ROMFS/px4fmu_common/init.d-posix/
# Copy world file
echo "Copying world files"
cp -avr $FIRMWARE_FILES/world/* $FIRMWARE_FOLDER/Tools/sitl_gazebo/worlds/
# Copy urdf files
echo "Copying world files"
cp -avr $FIRMWARE_FILES/urdf/* $FIRMWARE_FOLDER/Tools/sitl_gazebo/models/rotors_description/urdf/