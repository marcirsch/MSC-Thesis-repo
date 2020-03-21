#!/bin/bash
CARTOGRAPHER_FILE_FOLDER="$1"
CARTO_FOLDER="$2"
echo "Cartographer files folder: $CARTOGRAPHER_FILE_FOLDER"
echo "Cartographer install folder: $CARTO_FOLDER"


echo "Copying configuration files"
cp -avr $CARTOGRAPHER_FILE_FOLDER/configuration_files/* $CARTO_FOLDER/configuration_files

echo "Copying launch files"
cp -avr $CARTOGRAPHER_FILE_FOLDER/launch/* $CARTO_FOLDER/launch
