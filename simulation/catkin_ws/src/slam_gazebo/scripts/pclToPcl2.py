#!/usr/bin/env python

import rospy
from std_msgs.msg import String
from sensor_msgs.msg import PointCloud,PointCloud2
from sensor_msgs import point_cloud2
import std_msgs.msg
import math


pcl2_publishers = []

# Leave whole range
leave_full_range=1

# 4 sensors
angle_intevals = [
    [-15, 15, -15, 15], # Front
    [75, 105, -15, 15], # Right
    [-105, -75, -15, 15], # Left
    [165, 180, -15, 15], # Rear #1
    [-180, -165, -15, 15] # Rear #2
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

def publish_pcl2(publisher_index, cloud):
    global pcl2_publishers

    pcl2_publishers[publisher_index].publish(cloud)




def top_sensor(cloud):    
    publish_pcl2(0, convert_pcl_to_pcl2(cloud))

def bottom_sensor(cloud):    
    publish_pcl2(1, convert_pcl_to_pcl2(cloud))

def right_sensor(cloud):
    publish_pcl2(2, convert_pcl_to_pcl2(cloud))

def left_sensor(cloud):
    publish_pcl2(3, convert_pcl_to_pcl2(cloud))

def down_sensor(cloud):
    publish_pcl2(4, convert_pcl_to_pcl2(cloud))
    

    
    

if __name__ == '__main__':
    
    # Init node
    rospy.init_node('pclToPcl2', anonymous=True)

    #subscribe to topic
    rospy.Subscriber("/laser/top/scan", PointCloud, top_sensor)
    rospy.Subscriber("/laser/bottom/scan", PointCloud, bottom_sensor)


    pcl2_publishers.append(rospy.Publisher('points2_1', PointCloud2, queue_size=10))
    pcl2_publishers.append(rospy.Publisher('points2_2', PointCloud2, queue_size=10))

    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting Down")