
VOXEL_SIZE = 5e-2

include "transform.lua"

options = {
  tracking_frame = "base_link",
  pipeline = {
    {
      action = "min_max_range_filter",
      min_range = 0.2,
      max_range = 3.7,
    },
    {
      action = "dump_num_points",
    },

    --  -- Remove moving objects
    --  {
    --     action = "voxel_filter_and_remove_moving_objects",
    --     voxel_size = VOXEL_SIZE,
    --   },

    -- Gray X-Rays. These only use geometry to color pixels.
    {
      action = "write_xray_image",
      voxel_size = VOXEL_SIZE,
      filename = "xray_yz_all",
      transform = YZ_TRANSFORM,
    },
    {
      action = "write_xray_image",
      voxel_size = VOXEL_SIZE,
      filename = "xray_xy_all",
      transform = XY_TRANSFORM,
    },
    {
      action = "write_xray_image",
      voxel_size = VOXEL_SIZE,
      filename = "xray_xz_all",
      transform = XZ_TRANSFORM,
    },

    -- Now we recolor our points by frame and write another batch of X-Rays. It
    -- is visible in them what was seen by the horizontal and the vertical
    -- laser.
    {
      action = "color_points",
      frame_id = "laser_top_link",
      color = { 255., 0., 0. },
    },
    {
      action = "color_points",
      frame_id = "laser_bottom_link",
      color = { 0., 255., 0. },
    },

    {
      action = "write_xray_image",
      voxel_size = VOXEL_SIZE,
      filename = "xray_yz_all_color",
      transform = YZ_TRANSFORM,
    },
    {
      action = "write_xray_image",
      voxel_size = VOXEL_SIZE,
      filename = "xray_xy_all_color",
      transform = XY_TRANSFORM,
    },
    {
      action = "write_xray_image",
      voxel_size = VOXEL_SIZE,
      filename = "xray_xz_all_color",
      transform = XZ_TRANSFORM,
    },
    -- We also write a PLY file at this stage, because gray points look good.
    -- The points in the PLY can be visualized using
    -- https://github.com/googlecartographer/point_cloud_viewer.
    {
      action = "write_xyz",
      filename = "points.xyz",
    },
    {
      action = "write_probability_grid",
      draw_trajectories = true,
      resolution = 0.05,
      range_data_inserter = {
        insert_free_space = true,
        hit_probability = 0.55,
        miss_probability = 0.49,
      },
      filename = "probability_grid",
    },
  }
}

return options
