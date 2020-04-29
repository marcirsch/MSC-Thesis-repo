#!/usr/bin/env python

from std_msgs.msg import String
from gazebo_msgs.msg import LinkStates
from geometry_msgs.msg import Pose
import std_msgs.msg
import math
import rosbag
import sys

inBagPath = str(sys.argv[1])
outFile = str(sys.argv[2])

linkName = "iris_vl53l1x::iris::base_link"



if __name__ == "__main__":
    f = open(outFile, "w")
    for topic, msg, t in rosbag.Bag(inBagPath).read_messages(topics = ["/gazebo/link_states"]):
        ind = msg.name.index(linkName)
        link_pose = msg.pose[ind]

        f.write(str(link_pose.position.x) + "," + str(link_pose.position.y) + "," + str(link_pose.position.z))
        f.write("," + str(link_pose.orientation.w) + "," + str(link_pose.orientation.x) + "," + str(link_pose.orientation.y) + "," + str(link_pose.orientation.z))
        f.write("\n")    
    f.close()