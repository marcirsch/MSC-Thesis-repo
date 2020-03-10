# Build and install.
CMPF=${CMAKE_PREFIX_PATH//:/;}
catkin_make_isolated --install --use-ninja \
  -DCMAKE_PREFIX_PATH="${PWD}/install_isolated;${PWD}/protobuf/install;${CMPF}" \
  -DCATKIN_ENABLE_TESTING=false
source install_isolated/setup.bash