#!/usr/bin/env python

from std_msgs.msg import String
from sensor_msgs.msg import PointCloud,PointCloud2
from sensor_msgs import point_cloud2
import std_msgs.msg
import math
import rosbag
import sys
import numpy as np
from enum import Enum
import LidarConfiguration

# Get input and output bag paths from commandline
inBagPath = str(sys.argv[1])
outBagPath = str(sys.argv[2])

# Set lidar config to be used here
lidar_claster = LidarConfiguration.lidar_even_full
lidar_max_distance = 4.0
lidar_sampling_time = 0.0

topic_list = [
    "/clock",
    "/laser/top/scan",
    "/laser/bottom/scan",
    "/gazebo/link_states",
    "/mavros/global_position/local",
    "/mavros/imu/data"
    ]


class PointCloudFilter:
    class FilterType(Enum):
        noFilter=1
        average=2

    def __init__(self, clasters, Ts, max_distance):
        self.clasters = clasters
        self.Ts = Ts
        self.max_distance = max_distance

        self.timeOfLastMessage = 0

    def _getAngles(self, point1, point2):
        # u*v=ux*vx+uy*vy+uz*vz
        pointsProduct = point1[0] * point2[0] + point1[1] * point2[1] + point1[2] * point2[2]
        # |u|
        mag1 = math.sqrt(point1[0]*point1[0] + point1[1]*point1[1] + point1[2]*point1[2])
        # |v|
        mag2 = math.sqrt(point2[0]*point2[0] + point2[1]*point2[1] + point2[2]*point2[2])
        # alpha = cos^-1 (u*v / |u|*|v|)
        cosInternal = pointsProduct/(mag1*mag2)
        alpha = math.acos(cosInternal)
        return math.degrees(alpha)

    def _getVectorAngles(self, point):
        horizontal_angle = math.degrees(math.atan2(point[1], point[0]))
        vertical_angle = math.degrees(math.atan2(point[2], math.sqrt(point[0]*point[0] + point[1]*point[1])))
        return horizontal_angle, vertical_angle
    
    def _claster_point(self, point):
        
        for index in range(len(self.clasters)):
            claster = self.clasters[index]
            if self._getAngles(claster.vector, point) <= claster.alpha:
                return index
        return -1

    # Get list of points from Pointcloud points field that went through filter
    def claster_points_from_pcl(self, pcl):
        # Create points list 
        clastered_points = [[] for i in range(len(self.clasters))]

        for point in pcl.points:
            point_array = [point.x, point.y, point.z]
            index = self._claster_point(point_array)
            if index >= 0:
                clastered_points[index].append(point_array)
        return clastered_points

    def average_clastered_points(self, clastered_points):
        # Calculate average for clasters
        points_avg = []
        for clastered_point in clastered_points:
            # print(claster)
            # print(claster[:,0])
            claster_np = np.array(clastered_point)
            x = np.average(claster_np[:,0])
            y = np.average(claster_np[:,1])
            z = np.average(claster_np[:,2])
            points_avg.append([x,y,z])
        return points_avg

    def points_to_pcl2(self, pcl, points):
        # Convert 2D clastered list to 1D list using python magic

            # points = [j for sub in points for j in sub]

        return point_cloud2.create_cloud_xyz32(pcl.header, points)

    def _get_distance(self, point):
        return math.sqrt( math.pow(point[0],2) + math.pow(point[1],2) + math.pow(point[2],2) )

    def maximize_distance(self, points, max_distance):
        points_maximized = []
        for point in points:
            if self._get_distance(point) > max_distance:
                horizontal_angle, vertical_angle = self._getVectorAngles(point)
                x_new = math.cos(math.radians(vertical_angle)) * math.cos(math.radians(horizontal_angle)) * max_distance
                y_new = math.cos(math.radians(vertical_angle)) * math.sin(math.radians(horizontal_angle)) * max_distance
                z_new = math.sin(math.radians(vertical_angle)) * max_distance
                point = [x_new, y_new, z_new]
            points_maximized.append(point)
        return points_maximized
        
    
    def filter_and_convert(self, pcl, filter_type = FilterType.noFilter):
        pclTimestamp = pcl.header.stamp.secs + pcl.header.stamp.nsecs/1000000000.0
        
        # Return None to reduce samples according to sampling time
        if pclTimestamp - self.timeOfLastMessage < self.Ts:
            return None
        
        self.timeOfLastMessage = pclTimestamp

        # Claster points 
        clastered_points = self.claster_points_from_pcl(pcl)
        # Filter points
        if filter_type == self.FilterType.noFilter:
            filtered_points = []
            for point_list in clastered_points:
                for point in point_list:
                    filtered_points.append(point)
        elif filter_type == self.FilterType.average:
            filtered_points = self.average_clastered_points(clastered_points)
        # Apply distance filter
        if self.max_distance != 0:
            filtered_points = self.maximize_distance(filtered_points, self.max_distance)
        # Construct pcl2
        pcl2 = self.points_to_pcl2(pcl, filtered_points)

        return pcl2



# Matches points against angle_intervals
# Returns index of interval
# Returns -1 if not in any of the intervals

if __name__ == "__main__":
    topFilter = PointCloudFilter(lidar_claster, lidar_sampling_time, lidar_max_distance)
    bottomFilter = PointCloudFilter(lidar_claster, lidar_sampling_time, lidar_max_distance)

    startTime = 0
    with rosbag.Bag(outBagPath, 'w') as outbag:
        for topic, msg, t in rosbag.Bag(inBagPath).read_messages(topics=topic_list):
            if startTime == 0:
                startTime = t
                
            if topic == "/laser/top/scan":
                filtered_pcl2 = topFilter.filter_and_convert(msg, PointCloudFilter.FilterType.noFilter)
                if filtered_pcl2 != None:
                    outbag.write("points2_1", filtered_pcl2, t)
            elif topic == "/laser/bottom/scan":
                filtered_pcl2 = bottomFilter.filter_and_convert(msg, PointCloudFilter.FilterType.noFilter)
                if filtered_pcl2 != None:
                    outbag.write("points2_2", filtered_pcl2, t)
            
            if not "points2" in topic:
                outbag.write(topic, msg, t)
            
            timeElapsed = (t-startTime)
            timeElapsed = timeElapsed.secs + timeElapsed.nsecs/1000000000.0
            if timeElapsed % 1.0 == 0:
                print(timeElapsed)