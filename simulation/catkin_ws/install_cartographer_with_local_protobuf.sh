# Source: https://gist.github.com/l1va/630043c4a23e6b3f5c73c088ba6b62d5

# cd ~/catkin_ws

# Install wstool and rosdep.
sudo apt-get update
sudo apt-get install -y python-wstool python-rosdep ninja-build

# Build sources with old protobuf firstly
catkin_make_isolated --install --use-ninja -DCATKIN_ENABLE_TESTING=false
wstool init src

# Merge the cartographer_ros.rosinstall file and fetch code for dependencies.
wstool merge -t src ~/catkin_ws/src/plato/installation_scripts/cartographer.rosinstall
wstool update -t src

# Install proto3 locally.
# Build and install in 'catkin_ws/protobuf/install' proto3.
set -o errexit
#set -o verbose
VERSION="v3.4.1"
git clone https://github.com/google/protobuf.git
cd protobuf
git checkout tags/${VERSION}
mkdir build
cd build
cmake -G Ninja \
  -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
  -DCMAKE_BUILD_TYPE=Release \
  -Dprotobuf_BUILD_TESTS=OFF \
  -DCMAKE_INSTALL_PREFIX=../install \
  ../cmake
ninja
ninja install
cd ../../

# Install deb dependencies.
# The command 'sudo rosdep init' will print an error if you have already
# executed it since installing ROS. This error can be ignored.
# sudo rosdep init
rosdep update
rosdep install --from-paths src --ignore-src --rosdistro=${ROS_DISTRO} -y

# Build and install.
CMPF=${CMAKE_PREFIX_PATH//:/;}
catkin_make_isolated --install --use-ninja \
  -DCMAKE_PREFIX_PATH="${PWD}/install_isolated;${PWD}/protobuf/install;${CMPF}" \
  -DCATKIN_ENABLE_TESTING=false
source install_isolated/setup.bash