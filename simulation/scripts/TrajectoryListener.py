#!/usr/bin/env python

import rospy
from visualization_msgs.msg import MarkerArray
from geometry_msgs.msg import PoseStamped
import sys

posePublisher = None
file = None

# inBagPath = str(sys.argv[1])
outFile = str(sys.argv[1])


def callback(data):
    global posePublisher
    # print(data)

    # for marker in data.markers:
    if len(data.markers) == 0:
        return
        
    marker = data.markers[-1]
    if marker.ns == 'Trajectory 1':
        print(marker.points[-1].x)

        p = PoseStamped()
        p.header.frame_id = '/map'
        p.header.stamp = rospy.Time.now()

        p.pose.position.x = marker.points[-1].x
        p.pose.position.y = marker.points[-1].y
        p.pose.position.z = marker.points[-1].z
        posePublisher.publish(p)

        file.write(str(marker.points[-1].x) + "," + str(marker.points[-1].y) + "," + str(marker.points[-1].z))
        file.write("\n")

if __name__ == '__main__':
    file = open(outFile, "w")

    rospy.init_node('TrajectoryListener', anonymous=True)
    posePublisher = rospy.Publisher('PoseFromTrajectory', PoseStamped, queue_size=1) 
    rospy.Subscriber("trajectory_node_list", MarkerArray, callback)
    rospy.spin()

    file.close()