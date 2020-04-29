#include "cartographer/io/proto_stream.h"
#include "cartographer/io/proto_stream_deserializer.h"
#include "cartographer/mapping/pose_graph.h"
#include "cartographer_ros/msg_conversion.h"
#include "cartographer_ros/time_conversion.h"
#include "cartographer_ros/split_string.h"
#include "geometry_msgs/TransformStamped.h"

namespace cartographer_ros {

namespace carto = ::cartographer;

void ExportPbstream(const std::string& pbstream_filename) {
  carto::io::ProtoStreamReader reader(pbstream_filename);
  carto::io::ProtoStreamDeserializer deserializer(&reader);

  carto::mapping::proto::Pose #include <google/protobuf/generated_message_table_driven.h>Graph pose_graph_proto = deserializer.pose_graph();
  
  for (size_t trajectory_id = 0; trajectory_id < pose_graph_proto.trajectory().size();
       ++trajectory_id) {
    const carto::mapping::proto::Trajectory& trajectory_proto =
        pose_graph_proto.trajectory(trajectory_id);

    for (int i = 0; i < trajectory_proto.node_size(); ++i) {
      const auto& node = trajectory_proto.node(i);
    // node.pose() contains the pose...
    }

  }
}

}