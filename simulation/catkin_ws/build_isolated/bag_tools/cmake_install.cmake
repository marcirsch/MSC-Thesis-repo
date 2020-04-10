# Install script for directory: /home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/src/srv_tools/bag_tools

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/install_isolated")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
        file(MAKE_DIRECTORY "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
      endif()
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin")
        file(WRITE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin" "")
      endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/install_isolated/_setup_util.py")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/install_isolated" TYPE PROGRAM FILES "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/build_isolated/bag_tools/catkin_generated/installspace/_setup_util.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/install_isolated/env.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/install_isolated" TYPE PROGRAM FILES "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/build_isolated/bag_tools/catkin_generated/installspace/env.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/install_isolated/setup.bash;/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/install_isolated/local_setup.bash")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/install_isolated" TYPE FILE FILES
    "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/build_isolated/bag_tools/catkin_generated/installspace/setup.bash"
    "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/build_isolated/bag_tools/catkin_generated/installspace/local_setup.bash"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/install_isolated/setup.sh;/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/install_isolated/local_setup.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/install_isolated" TYPE FILE FILES
    "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/build_isolated/bag_tools/catkin_generated/installspace/setup.sh"
    "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/build_isolated/bag_tools/catkin_generated/installspace/local_setup.sh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/install_isolated/setup.zsh;/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/install_isolated/local_setup.zsh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/install_isolated" TYPE FILE FILES
    "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/build_isolated/bag_tools/catkin_generated/installspace/setup.zsh"
    "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/build_isolated/bag_tools/catkin_generated/installspace/local_setup.zsh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/install_isolated/.rosinstall")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/install_isolated" TYPE FILE FILES "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/build_isolated/bag_tools/catkin_generated/installspace/.rosinstall")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/build_isolated/bag_tools/catkin_generated/installspace/bag_tools.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/bag_tools/cmake" TYPE FILE FILES
    "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/build_isolated/bag_tools/catkin_generated/installspace/bag_toolsConfig.cmake"
    "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/build_isolated/bag_tools/catkin_generated/installspace/bag_toolsConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/bag_tools" TYPE FILE FILES "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/src/srv_tools/bag_tools/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/bag_tools/extract_images" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/bag_tools/extract_images")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/bag_tools/extract_images"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/bag_tools" TYPE EXECUTABLE FILES "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/devel_isolated/bag_tools/lib/bag_tools/extract_images")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/bag_tools/extract_images" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/bag_tools/extract_images")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/bag_tools/extract_images"
         OLD_RPATH "/opt/ros/melodic/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/bag_tools/extract_images")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/bag_tools/extract_images_from_realsense" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/bag_tools/extract_images_from_realsense")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/bag_tools/extract_images_from_realsense"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/bag_tools" TYPE EXECUTABLE FILES "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/devel_isolated/bag_tools/lib/bag_tools/extract_images_from_realsense")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/bag_tools/extract_images_from_realsense" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/bag_tools/extract_images_from_realsense")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/bag_tools/extract_images_from_realsense"
         OLD_RPATH "/opt/ros/melodic/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/bag_tools/extract_images_from_realsense")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/bag_tools/extract_tum_format" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/bag_tools/extract_tum_format")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/bag_tools/extract_tum_format"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/bag_tools" TYPE EXECUTABLE FILES "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/devel_isolated/bag_tools/lib/bag_tools/extract_tum_format")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/bag_tools/extract_tum_format" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/bag_tools/extract_tum_format")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/bag_tools/extract_tum_format"
         OLD_RPATH "/opt/ros/melodic/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/bag_tools/extract_tum_format")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/bag_tools/extract_stereo_images" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/bag_tools/extract_stereo_images")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/bag_tools/extract_stereo_images"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/bag_tools" TYPE EXECUTABLE FILES "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/devel_isolated/bag_tools/lib/bag_tools/extract_stereo_images")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/bag_tools/extract_stereo_images" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/bag_tools/extract_stereo_images")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/bag_tools/extract_stereo_images"
         OLD_RPATH "/opt/ros/melodic/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/bag_tools/extract_stereo_images")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/bag_tools/process_stereo" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/bag_tools/process_stereo")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/bag_tools/process_stereo"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/bag_tools" TYPE EXECUTABLE FILES "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/devel_isolated/bag_tools/lib/bag_tools/process_stereo")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/bag_tools/process_stereo" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/bag_tools/process_stereo")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/bag_tools/process_stereo"
         OLD_RPATH "/opt/ros/melodic/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/bag_tools/process_stereo")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/bag_tools" TYPE PROGRAM FILES
    "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/src/srv_tools/bag_tools/scripts/add_header_time_offset.py"
    "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/src/srv_tools/bag_tools/scripts/bag_add_time_offset.py"
    "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/src/srv_tools/bag_tools/scripts/batch_process.py"
    "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/src/srv_tools/bag_tools/scripts/camera_info_parser.py"
    "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/src/srv_tools/bag_tools/scripts/change_camera_info.py"
    "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/src/srv_tools/bag_tools/scripts/change_frame_id.py"
    "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/src/srv_tools/bag_tools/scripts/change_topics.py"
    "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/src/srv_tools/bag_tools/scripts/check_delay.py"
    "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/src/srv_tools/bag_tools/scripts/check_drop.py"
    "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/src/srv_tools/bag_tools/scripts/cut.py"
    "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/src/srv_tools/bag_tools/scripts/extract_topics.py"
    "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/src/srv_tools/bag_tools/scripts/gps_to_std_gt.py"
    "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/src/srv_tools/bag_tools/scripts/image_sequence_publisher.py"
    "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/src/srv_tools/bag_tools/scripts/make_video.py"
    "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/src/srv_tools/bag_tools/scripts/merge.py"
    "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/src/srv_tools/bag_tools/scripts/plot.py"
    "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/src/srv_tools/bag_tools/scripts/remove_tf.py"
    "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/src/srv_tools/bag_tools/scripts/replace_msg_time_with_hdr.py"
    "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/src/srv_tools/bag_tools/scripts/stereo_sequence_publisher.py"
    "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/src/srv_tools/bag_tools/scripts/transform_tf.py"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/bag_tools/launch" TYPE DIRECTORY FILES "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/src/srv_tools/bag_tools/launch/" REGEX "/\\.svn$" EXCLUDE)
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/build_isolated/bag_tools/gtest/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/rschmarci/MSC-Thesis-repo/simulation/catkin_ws/build_isolated/bag_tools/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
