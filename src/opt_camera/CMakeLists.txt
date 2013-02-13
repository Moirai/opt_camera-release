cmake_minimum_required(VERSION 2.8.3)
project(opt_camera)

find_package(catkin REQUIRED COMPONENTS sensor_msgs driver_base image_proc dynamic_reconfigure camera_calibration_parsers compressed_image_transport cv_bridge rospack)
find_package(OpenCV REQUIRED)

# generate the dynamic_reconfigure config file   
generate_dynamic_reconfigure_options(cfg/OptNM33Camera.cfg)


# define the project
catkin_package(
   INCLUDE_DIRS src #include the header with src/opt_nm33_uvc
   LIBRARIES ${PROJECT_NAME}
   CATKIN_DEPENDS sensor_msgs driver_base image_proc dynamic_reconfigure camera_calibration_parsers compressed_image_transport cv_bridge
   DEPENDS opencv
)


include_directories(src)
include_directories(${CATKIN_DEVEL_PREFIX}/${CATKIN_GLOBAL_INCLUDE_DESTINATION}) 
include_directories(SYSTEM ${OpenCV_INCLUDE_DIRS})
include_directories(${catkin_INCLUDE_DIRS})


# create nm33_node
add_executable(nm33_node src/nm33_node.cpp src/opt_nm33_uvc/opt_nm33_camera.cpp src/opt_nm33_uvc/opt_nm33_uvc.cpp)
target_link_libraries(nm33_node ${catkin_LIBRARIES} ${OpenCV_LIBRARIES})
install(TARGETS nm33_node
        RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)

# create init_xu_register 
add_executable(init_xu_register src/opt_nm33_uvc/init_xu_register.cpp src/opt_nm33_uvc/opt_nm33_uvc.cpp)
target_link_libraries(nm33_node ${OpenCV_LIBRARIES})
install(TARGETS init_xu_register
        RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)

# create _non_std_uvc
add_executable(nm33_node_non_std_uvc src/nm33_node.cpp src/opt_nm33_uvc/opt_nm33_camera.cpp src/opt_nm33_uvc/opt_nm33_uvc.cpp)
target_link_libraries(nm33_node_non_std_uvc ${catkin_LIBRARIES} ${OpenCV_LIBRARIES})
set_target_properties(nm33_node_non_std_uvc PROPERTIES COMPILE_FLAGS -DNON_STD_UVC=1)
install(TARGETS nm33_node_non_std_uvc
        RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)
add_executable(init_xu_register_non_std_uvc src/opt_nm33_uvc/init_xu_register.cpp src/opt_nm33_uvc/opt_nm33_uvc.cpp)
target_link_libraries(init_xu_register_non_std_uvc ${OpenCV_LIBRARIES})
set_target_properties(init_xu_register_non_std_uvc PROPERTIES COMPILE_FLAGS -DNON_STD_UVC=1)
install(TARGETS init_xu_register_non_std_uvc
        RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)



# test
#catkin_add_gtest()    

