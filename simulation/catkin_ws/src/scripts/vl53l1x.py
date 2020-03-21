#!/usr/bin/env python

# license removed for brevity
import rospy
from std_msgs.msg import String
from sensor_msgs.msg import PointCloud
from sensor_msgs.msg import PointCloud2
import sensor_msgs.point_cloud2 as pcl2

import std_msgs.msg


# publisher = rospy.Publisher('VL53L1X/front', PointCloud2, queue_size=10)

#!/usr/bin/env python

import rospy
from std_msgs.msg import String
from sensor_msgs.msg import PointCloud,PointCloud2

import std_msgs.msg


def front_sensor(cloud):
    rospy.loginfo(rospy.get_caller_id() + "I heard %s", cloud)

    exit()

    
    

if __name__ == '__main__':
    
    # Init node
    rospy.init_node('pclToPcl2', anonymous=True)

    #subscribe to topic
    rospy.Subscriber("/laser/front/scan", PointCloud, front_sensor)


    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting Down")
    #header
    header = std_msgs.msg.Header()
    header.stamp = rospy.Time.now()
    header.frame_id = 'map'
    #create pcl from points
    scaled_polygon_pcl = pcl2.create_cloud_xyz32(header, cloud)
    #publish    
    rospy.loginfo("happily publishing sample pointcloud.. !")
    pcl_pub.publish(scaled_polygon_pcl)


if __name__ == '__main__':
    
    # Init node
    rospy.init_node('VL53L1X', anonymous=True)
    
    #subscribe to topic
    rospy.Subscriber("/laser/front/scan", PointCloud, front_sensor)

    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting Down")