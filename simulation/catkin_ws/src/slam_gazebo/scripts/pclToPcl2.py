#!/usr/bin/env python

import rospy
from std_msgs.msg import String
from sensor_msgs.msg import PointCloud,PointCloud2
from sensor_msgs import point_cloud2

import std_msgs.msg


pcl2_publishers = []


def convert_pcl_to_pcl2(pcl):
    points_list = []

    for point in pcl.points:
        points_list.append([point.x, point.y, point.z])

    return point_cloud2.create_cloud_xyz32(pcl.header, points_list)

def publish_pcl2(publisher_index, cloud):
    global pcl2_publishers

    pcl2_publishers[publisher_index].publish(cloud)




def front_sensor(cloud):    
    publish_pcl2(0, convert_pcl_to_pcl2(cloud))

def rear_sensor(cloud):    
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
    rospy.Subscriber("/laser/top/scan", PointCloud, front_sensor)
    rospy.Subscriber("/laser/bottom/scan", PointCloud, rear_sensor)
    rospy.Subscriber("/laser/right/scan", PointCloud, right_sensor)
    rospy.Subscriber("/laser/left/scan", PointCloud, left_sensor)
    rospy.Subscriber("/laser/down/scan", PointCloud, down_sensor)


    pcl2_publishers.append(rospy.Publisher('points2_1', PointCloud2, queue_size=10))
    pcl2_publishers.append(rospy.Publisher('points2_2', PointCloud2, queue_size=10))
    pcl2_publishers.append(rospy.Publisher('points2_3', PointCloud2, queue_size=10))
    pcl2_publishers.append(rospy.Publisher('points2_4', PointCloud2, queue_size=10))
    pcl2_publishers.append(rospy.Publisher('points2_5', PointCloud2, queue_size=10))


    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting Down")