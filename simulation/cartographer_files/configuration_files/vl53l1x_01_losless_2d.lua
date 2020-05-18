-- Copyright 2016 The Cartographer Authors
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--      http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

include "map_builder.lua"
include "trajectory_builder.lua"

options = {
  map_builder = MAP_BUILDER,
  trajectory_builder = TRAJECTORY_BUILDER,
  map_frame = "map",
  tracking_frame = "base_link",
  published_frame = "base_link",
  odom_frame = "odom",
  provide_odom_frame = true,
  publish_frame_projected_to_2d = false,
  use_odometry = false,
  use_nav_sat = false,  
  use_landmarks = false,
  num_laser_scans = 0,
  num_multi_echo_laser_scans = 0,
  num_subdivisions_per_laser_scan = 1,
  num_point_clouds = 2,
  lookup_transform_timeout_sec = 0.2,
  submap_publish_period_sec = 0.3,
  pose_publish_period_sec = 5e-3,
  trajectory_publish_period_sec = 30e-3,
  rangefinder_sampling_ratio = 1.,
  odometry_sampling_ratio = 1.,
  fixed_frame_pose_sampling_ratio = 1.,
  imu_sampling_ratio = 1.,
  landmarks_sampling_ratio = 1.,
}
MAX_RANGE = 3.7

-- --------------------LOCAL SLAM--------------------
TRAJECTORY_BUILDER_2D.min_range = 0.4
TRAJECTORY_BUILDER_2D.max_range = MAX_RANGE
TRAJECTORY_BUILDER_2D.min_z = -0.1
TRAJECTORY_BUILDER_2D.max_z = 0.5
TRAJECTORY_BUILDER_2D.missing_data_ray_length = 3.
TRAJECTORY_BUILDER_2D.num_accumulated_range_data = 2
TRAJECTORY_BUILDER_2D.use_imu_data = true
TRAJECTORY_BUILDER_2D.imu_gravity_time_constant = 0.5
TRAJECTORY_BUILDER_2D.motion_filter.max_time_seconds=0.03

TRAJECTORY_BUILDER_2D.ceres_scan_matcher.translation_weight = 5.
TRAJECTORY_BUILDER_2D.ceres_scan_matcher.rotation_weight = 5.
TRAJECTORY_BUILDER_2D.submaps.num_range_data = 90

-- --------------------GLOBAL SLAM--------------------

MAP_BUILDER.use_trajectory_builder_2d = true
MAP_BUILDER.num_background_threads = 7

POSE_GRAPH.optimize_every_n_nodes = 90
POSE_GRAPH.constraint_builder.fast_correlative_scan_matcher.linear_search_window = 0.25
POSE_GRAPH.constraint_builder.fast_correlative_scan_matcher.angular_search_window = math.rad(15.)


-- TRAJECTORY_BUILDER_2D.voxel_filter_size = 0.05
-- TRAJECTORY_BUILDER_2D.min_z = -0.


-- TRAJECTORY_BUILDER_2D.motion_filter.max_time_seconds = 0.01
-- TRAJECTORY_BUILDER_2D.imu_gravity_time_constant = 0.5
-- POSE_GRAPH.optimize_every_n_nodes = 120

-- TRAJECTORY_BUILDER_2D.submaps.num_range_data = 60


-- TRAJECTORY_BUILDER_2D.use_online_correlative_scan_matching = true
-- TRAJECTORY_BUILDER_2D.use_imu_data = true
-- TRAJECTORY_BUILDER_2D.real_time_correlative_scan_matcher.linear_search_window = 0.15
-- TRAJECTORY_BUILDER_2D.real_time_correlative_scan_matcher.angular_search_window = math.rad(45.)

-- POSE_GRAPH.optimization_problem.huber_scale = 1e2


-- TRAJECTORY_BUILDER_2D.min_z = -0.1
-- TRAJECTORY_BUILDER_2D.min_range = 0.3
-- TRAJECTORY_BUILDER_2D.max_range = MAX_RANGE
-- TRAJECTORY_BUILDER_2D.missing_data_ray_length = 8.0

-- TRAJECTORY_BUILDER_2D.use_imu_data = true
-- TRAJECTORY_BUILDER_2D.motion_filter.max_time_seconds = 0.01
-- TRAJECTORY_BUILDER_2D.imu_gravity_time_constant = 0.5
-- TRAJECTORY_BUILDER_2D.submaps.num_range_data = 15


-- TRAJECTORY_BUILDER_2D.use_online_correlative_scan_matching = true
-- TRAJECTORY_BUILDER_2D.real_time_correlative_scan_matcher.angular_search_window = math.rad(45.)

-- TRAJECTORY_BUILDER_2D.adaptive_voxel_filter.min_num_points=50
-- TRAJECTORY_BUILDER_2D.adaptive_voxel_filter.max_range = 4.0




-- TRAJECTORY_BUILDER_3D.min_range = 0.2
-- TRAJECTORY_BUILDER_3D.max_range = MAX_RANGE
-- TRAJECTORY_BUILDER_3D.num_accumulated_range_data = 1.
-- TRAJECTORY_BUILDER_3D.voxel_filter_size = 0.3
-- TRAJECTORY_BUILDER_3D.imu_gravity_time_constant = 0.5

-- TRAJECTORY_BUILDER_3D.low_resolution_adaptive_voxel_filter.max_length = 4.
-- TRAJECTORY_BUILDER_3D.low_resolution_adaptive_voxel_filter.min_num_points = 100
-- TRAJECTORY_BUILDER_3D.low_resolution_adaptive_voxel_filter.max_range = MAX_RANGE  

-- TRAJECTORY_BUILDER_3D.high_resolution_adaptive_voxel_filter.max_length = 1.0
-- TRAJECTORY_BUILDER_3D.high_resolution_adaptive_voxel_filter.min_num_points = 50
-- TRAJECTORY_BUILDER_3D.high_resolution_adaptive_voxel_filter.max_range = 2.  

-- MAP_BUILDER.use_trajectory_builder_3d = true
-- MAP_BUILDER.num_background_threads = 7

-- POSE_GRAPH.optimization_problem.huber_scale = 5e2
-- POSE_GRAPH.optimize_every_n_nodes = 0
-- POSE_GRAPH.constraint_builder.sampling_ratio = 0.03
-- POSE_GRAPH.optimization_problem.ceres_solver_options.max_num_iterations = 10
-- POSE_GRAPH.constraint_builder.min_score = 0.62
-- POSE_GRAPH.constraint_builder.global_localization_min_score = 0.66
-- POSE_GRAPH.constraint_builder.log_matches = true



return options
