import rosbag
import sys

inBagPath = str(sys.argv[0])
outBagPath = str(sys.argv[1])


with rosbag.Bag(outBagPath, 'w') as outbag:
    for topic, msg, t in rosbag.Bag(inBagPath).read_messages():
        # This also replaces tf timestamps under the assumption 
        # that all transforms in the message share the same timestamp
        if topic == "/tf" and msg.transforms:
            outbag.write(topic, msg, msg.transforms[0].header.stamp)
        else:
            outbag.write(topic, msg, msg.header.stamp if msg._has_header else t)