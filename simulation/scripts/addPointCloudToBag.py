#!/usr/bin/env python

from std_msgs.msg import String
from sensor_msgs.msg import PointCloud,PointCloud2
from sensor_msgs import point_cloud2
import std_msgs.msg
import math
import rosbag
import sys

# Get input and output bag paths from commandline
inBagPath = str(sys.argv[1])
outBagPath = str(sys.argv[2])


# Leave whole range
leave_full_range=1

# 4 sensors
angle_intevals = [
    # [-360, 360, -45, 45] # 45 degrees filter all horizontal dirs
    # [-15, 15, -15, 15], # Front
    # [75, 105, -15, 15], # Right
    # [-105, -75, -15, 15], # Left
    # [165, 180, -15, 15], # Rear #1
    # [-180, -165, -15, 15] # Rear #2
]



def filter_single_point(point):
    if leave_full_range==1:
        return True

    horizontal_angle = math.degrees(math.atan2(point.y, point.x))
    vertical_angle = math.degrees(math.atan2(point.z, math.sqrt(point.x*point.x + point.y*point.y)))

    # print("alfa: " + str(horizontal_angle) + " beta: " + str(vertical_angle))
    for angle_th in angle_intevals:
        is_in_interval = horizontal_angle >= angle_th[0] and horizontal_angle <= angle_th[1] and vertical_angle >= angle_th[2] and vertical_angle <= angle_th[3]
        if is_in_interval:
            return True

    return False
    

def filter_pointcloud(pcl):
    points_list = []

    for point in pcl.points:
        if filter_single_point(point):
            points_list.append([point.x, point.y, point.z])
    return points_list

def convert_pcl_to_pcl2(pcl):
    points_list = filter_pointcloud(pcl)
    return point_cloud2.create_cloud_xyz32(pcl.header, points_list)

with rosbag.Bag(outBagPath, 'w') as outbag:
    for topic, msg, t in rosbag.Bag(inBagPath).read_messages():
            
        if topic == "/laser/top/scan":
            convertedPcl2 = convert_pcl_to_pcl2(msg)
            outbag.write("points2_1", convertedPcl2, t)
        elif topic == "/laser/bottom/scan":
            convertedPcl2 = convert_pcl_to_pcl2(msg)
            outbag.write("points2_2", convertedPcl2, t)
        
        outbag.write(topic, msg, t)