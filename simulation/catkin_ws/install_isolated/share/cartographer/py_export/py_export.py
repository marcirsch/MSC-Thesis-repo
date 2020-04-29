 #!/usr/bin/env python3

# sudo apt-get install protobuf-compiler
# roscd cartographer && mkdir py_export
# protoc --python_out ./py_export -I . `find . -iname '*.proto'`

import struct
import gzip

import cartographer.mapping
import cartographer.mapping.proto.sparse_pose_graph_pb2
import cartographer.mapping.proto.serialization_pb2

class PoseGraphFile(object):
    def __init__(self, pose_graph_filename):
        self.pose_graph_filename = pose_graph_filename
        self.pose_graph_file = open(pose_graph_filename, 'rb')
        assert(self.is_valid())

        self.sd = cartographer.mapping.proto.serialization_pb2.SerializedData()
        self.spg = cartographer.mapping.proto.sparse_pose_graph_pb2.SparsePoseGraph()

        self.read_sparse_pose_graph()
        self.submaps = {}
        while self.pose_graph_file:
            serdata = self.read_serialized_data()
            if not serdata:
                break

    def read_sparse_pose_graph(self):
        sz = self.read_size()
        if sz == 0:
            return None
        buf = self.pose_graph_file.read(sz)
        buf = gzip.decompress(buf)
        self.spg.ParseFromString(buf)

    def read_serialized_data(self):
        sz = self.read_size()
        if sz == 0:
            return False
        buf = self.pose_graph_file.read(sz)
        buf = gzip.decompress(buf)
        self.sd.ParseFromString(buf)
        return True

    def is_valid(self):
        kMagic = [0x7b, 0x1d, 0x1f, 0x7b, 0x5b, 0xf5, 0x01, 0xdb]
        self.pose_graph_file.seek(0)
        magic = self.pose_graph_file.read(8)
        return all([x == y for x, y in zip(kMagic[::-1], magic)])

    def read_size(self):
        buf = self.pose_graph_file.read(8)
        if len(buf) < 8:
            return 0
        return struct.unpack_from("<Q", buf)[0]

    def num_trajectories(self):
        return len(self.spg.trajectory)

    def num_submaps(self, trajectory_id=None):
        if trajectory_id is not None:
            return len(self.spg.trajectory[trajectory_id].submap)
        else:
            return sum(map(lambda x: len(x.submap), self.spg.trajectory))

    def num_poses(self, trajectory_id=None):
        if trajectory_id is not None:
            return len(self.spg.trajectory[trajectory_id].node)
        else:
            return sum(map(lambda x: len(x.node), self.spg.trajectory))


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Process and export live SLAM results")
    parser.add_argument('pose_graph_filename', type=str)
    args = parser.parse_args()
    pg = PoseGraphFile(args.pose_graph_filename)
    print("Found: ", pg.num_trajectories(), " trajectories")

    for ii in range(0, pg.num_trajectories()):
        print(pg.num_submaps(ii), pg.num_poses(ii))
    print(pg.num_submaps(), pg.num_poses())

