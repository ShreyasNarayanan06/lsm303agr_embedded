# Install script for directory: /Users/naray/nordicsdks/zephyr

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
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

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "TRUE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/opt/nordic/ncs/toolchains/ef4fc6722e/opt/zephyr-sdk/arm-zephyr-eabi/bin/arm-zephyr-eabi-objdump")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/naray/Desktop/isc/embedded/lsm303agr_embedded/build/lsm303agr_embedded/zephyr/arch/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/naray/Desktop/isc/embedded/lsm303agr_embedded/build/lsm303agr_embedded/zephyr/lib/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/naray/Desktop/isc/embedded/lsm303agr_embedded/build/lsm303agr_embedded/zephyr/soc/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/naray/Desktop/isc/embedded/lsm303agr_embedded/build/lsm303agr_embedded/zephyr/boards/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/naray/Desktop/isc/embedded/lsm303agr_embedded/build/lsm303agr_embedded/zephyr/subsys/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/naray/Desktop/isc/embedded/lsm303agr_embedded/build/lsm303agr_embedded/zephyr/drivers/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/naray/Desktop/isc/embedded/lsm303agr_embedded/build/lsm303agr_embedded/modules/nrf/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/naray/Desktop/isc/embedded/lsm303agr_embedded/build/lsm303agr_embedded/modules/hostap/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/naray/Desktop/isc/embedded/lsm303agr_embedded/build/lsm303agr_embedded/modules/mcuboot/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/naray/Desktop/isc/embedded/lsm303agr_embedded/build/lsm303agr_embedded/modules/mbedtls/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/naray/Desktop/isc/embedded/lsm303agr_embedded/build/lsm303agr_embedded/modules/trusted-firmware-m/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/naray/Desktop/isc/embedded/lsm303agr_embedded/build/lsm303agr_embedded/modules/cjson/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/naray/Desktop/isc/embedded/lsm303agr_embedded/build/lsm303agr_embedded/modules/azure-sdk-for-c/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/naray/Desktop/isc/embedded/lsm303agr_embedded/build/lsm303agr_embedded/modules/cirrus-logic/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/naray/Desktop/isc/embedded/lsm303agr_embedded/build/lsm303agr_embedded/modules/openthread/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/naray/Desktop/isc/embedded/lsm303agr_embedded/build/lsm303agr_embedded/modules/suit-processor/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/naray/Desktop/isc/embedded/lsm303agr_embedded/build/lsm303agr_embedded/modules/memfault-firmware-sdk/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/naray/Desktop/isc/embedded/lsm303agr_embedded/build/lsm303agr_embedded/modules/canopennode/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/naray/Desktop/isc/embedded/lsm303agr_embedded/build/lsm303agr_embedded/modules/chre/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/naray/Desktop/isc/embedded/lsm303agr_embedded/build/lsm303agr_embedded/modules/lz4/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/naray/Desktop/isc/embedded/lsm303agr_embedded/build/lsm303agr_embedded/modules/nanopb/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/naray/Desktop/isc/embedded/lsm303agr_embedded/build/lsm303agr_embedded/modules/zscilib/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/naray/Desktop/isc/embedded/lsm303agr_embedded/build/lsm303agr_embedded/modules/cmsis/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/naray/Desktop/isc/embedded/lsm303agr_embedded/build/lsm303agr_embedded/modules/cmsis-dsp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/naray/Desktop/isc/embedded/lsm303agr_embedded/build/lsm303agr_embedded/modules/cmsis-nn/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/naray/Desktop/isc/embedded/lsm303agr_embedded/build/lsm303agr_embedded/modules/fatfs/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/naray/Desktop/isc/embedded/lsm303agr_embedded/build/lsm303agr_embedded/modules/hal_nordic/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/naray/Desktop/isc/embedded/lsm303agr_embedded/build/lsm303agr_embedded/modules/hal_st/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/naray/Desktop/isc/embedded/lsm303agr_embedded/build/lsm303agr_embedded/modules/hal_tdk/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/naray/Desktop/isc/embedded/lsm303agr_embedded/build/lsm303agr_embedded/modules/hal_wurthelektronik/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/naray/Desktop/isc/embedded/lsm303agr_embedded/build/lsm303agr_embedded/modules/liblc3/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/naray/Desktop/isc/embedded/lsm303agr_embedded/build/lsm303agr_embedded/modules/libmetal/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/naray/Desktop/isc/embedded/lsm303agr_embedded/build/lsm303agr_embedded/modules/littlefs/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/naray/Desktop/isc/embedded/lsm303agr_embedded/build/lsm303agr_embedded/modules/loramac-node/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/naray/Desktop/isc/embedded/lsm303agr_embedded/build/lsm303agr_embedded/modules/lvgl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/naray/Desktop/isc/embedded/lsm303agr_embedded/build/lsm303agr_embedded/modules/mipi-sys-t/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/naray/Desktop/isc/embedded/lsm303agr_embedded/build/lsm303agr_embedded/modules/nrf_wifi/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/naray/Desktop/isc/embedded/lsm303agr_embedded/build/lsm303agr_embedded/modules/open-amp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/naray/Desktop/isc/embedded/lsm303agr_embedded/build/lsm303agr_embedded/modules/percepio/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/naray/Desktop/isc/embedded/lsm303agr_embedded/build/lsm303agr_embedded/modules/picolibc/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/naray/Desktop/isc/embedded/lsm303agr_embedded/build/lsm303agr_embedded/modules/segger/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/naray/Desktop/isc/embedded/lsm303agr_embedded/build/lsm303agr_embedded/modules/tinycrypt/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/naray/Desktop/isc/embedded/lsm303agr_embedded/build/lsm303agr_embedded/modules/uoscore-uedhoc/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/naray/Desktop/isc/embedded/lsm303agr_embedded/build/lsm303agr_embedded/modules/zcbor/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/naray/Desktop/isc/embedded/lsm303agr_embedded/build/lsm303agr_embedded/modules/nrfxlib/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/naray/Desktop/isc/embedded/lsm303agr_embedded/build/lsm303agr_embedded/modules/nrf_hw_models/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/naray/Desktop/isc/embedded/lsm303agr_embedded/build/lsm303agr_embedded/modules/connectedhomeip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/naray/Desktop/isc/embedded/lsm303agr_embedded/build/lsm303agr_embedded/zephyr/kernel/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/naray/Desktop/isc/embedded/lsm303agr_embedded/build/lsm303agr_embedded/zephyr/cmake/flash/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/naray/Desktop/isc/embedded/lsm303agr_embedded/build/lsm303agr_embedded/zephyr/cmake/usage/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/Users/naray/Desktop/isc/embedded/lsm303agr_embedded/build/lsm303agr_embedded/zephyr/cmake/reports/cmake_install.cmake")
endif()

