# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "lidar: 0 messages, 1 services")

set(MSG_I_FLAGS "-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(lidar_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/slydite/robocon/1_lidar/src/lidar/srv/lidar.srv" NAME_WE)
add_custom_target(_lidar_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "lidar" "/home/slydite/robocon/1_lidar/src/lidar/srv/lidar.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(lidar
  "/home/slydite/robocon/1_lidar/src/lidar/srv/lidar.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lidar
)

### Generating Module File
_generate_module_cpp(lidar
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lidar
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(lidar_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(lidar_generate_messages lidar_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/slydite/robocon/1_lidar/src/lidar/srv/lidar.srv" NAME_WE)
add_dependencies(lidar_generate_messages_cpp _lidar_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(lidar_gencpp)
add_dependencies(lidar_gencpp lidar_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lidar_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(lidar
  "/home/slydite/robocon/1_lidar/src/lidar/srv/lidar.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/lidar
)

### Generating Module File
_generate_module_eus(lidar
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/lidar
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(lidar_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(lidar_generate_messages lidar_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/slydite/robocon/1_lidar/src/lidar/srv/lidar.srv" NAME_WE)
add_dependencies(lidar_generate_messages_eus _lidar_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(lidar_geneus)
add_dependencies(lidar_geneus lidar_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lidar_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(lidar
  "/home/slydite/robocon/1_lidar/src/lidar/srv/lidar.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lidar
)

### Generating Module File
_generate_module_lisp(lidar
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lidar
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(lidar_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(lidar_generate_messages lidar_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/slydite/robocon/1_lidar/src/lidar/srv/lidar.srv" NAME_WE)
add_dependencies(lidar_generate_messages_lisp _lidar_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(lidar_genlisp)
add_dependencies(lidar_genlisp lidar_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lidar_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(lidar
  "/home/slydite/robocon/1_lidar/src/lidar/srv/lidar.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/lidar
)

### Generating Module File
_generate_module_nodejs(lidar
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/lidar
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(lidar_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(lidar_generate_messages lidar_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/slydite/robocon/1_lidar/src/lidar/srv/lidar.srv" NAME_WE)
add_dependencies(lidar_generate_messages_nodejs _lidar_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(lidar_gennodejs)
add_dependencies(lidar_gennodejs lidar_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lidar_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(lidar
  "/home/slydite/robocon/1_lidar/src/lidar/srv/lidar.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lidar
)

### Generating Module File
_generate_module_py(lidar
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lidar
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(lidar_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(lidar_generate_messages lidar_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/slydite/robocon/1_lidar/src/lidar/srv/lidar.srv" NAME_WE)
add_dependencies(lidar_generate_messages_py _lidar_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(lidar_genpy)
add_dependencies(lidar_genpy lidar_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lidar_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lidar)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lidar
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(lidar_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET lidar_generate_messages_cpp)
  add_dependencies(lidar_generate_messages_cpp lidar_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/lidar)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/lidar
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(lidar_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET lidar_generate_messages_eus)
  add_dependencies(lidar_generate_messages_eus lidar_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lidar)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lidar
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(lidar_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET lidar_generate_messages_lisp)
  add_dependencies(lidar_generate_messages_lisp lidar_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/lidar)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/lidar
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(lidar_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET lidar_generate_messages_nodejs)
  add_dependencies(lidar_generate_messages_nodejs lidar_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lidar)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lidar\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lidar
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(lidar_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET lidar_generate_messages_py)
  add_dependencies(lidar_generate_messages_py lidar_generate_messages_py)
endif()
