#!/usr/bin/env python

from std_msgs.msg import String
from nav_msgs.msg import Odometry
import math
import rosbag
import sys

inBagPath = str(sys.argv[1])
outFile = str(sys.argv[2])


if __name__ == "__main__":
    f = open(outFile, "w")
    for topic, msg, t in rosbag.Bag(inBagPath).read_messages(topics = ["/mavros/global_position/local"]):
        # print(msg)

        f.write(str(msg.pose.pose.position.x) + "," + str(msg.pose.pose.position.y) + "," + str(msg.pose.pose.position.z))
        f.write("," + str(msg.pose.pose.orientation.w) + "," + str(msg.pose.pose.orientation.x) + "," + str(msg.pose.pose.orientation.y) + "," + str(msg.pose.pose.orientation.z))
        f.write("\n")    
    f.close()