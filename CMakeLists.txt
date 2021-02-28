cmake_minimum_required(VERSION 3.14)

project(lua_luajit_experiment LANGUAGES C VERSION 0.1)

#set(CMAKE_VERBOSE_MAKEFILE on)
#set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

include(ExternalProject)

set(lua542InstallDir ${CMAKE_CURRENT_BINARY_DIR}/lua542)
ExternalProject_Add(lua542
  URL               https://www.lua.org/ftp/lua-5.4.2.tar.gz
  CONFIGURE_COMMAND ""
  BUILD_IN_SOURCE   true
  INSTALL_COMMAND   make install INSTALL_TOP=${lua542InstallDir}
)

set(luajitInstallDir ${CMAKE_CURRENT_BINARY_DIR}/luajit)
ExternalProject_Add(luajit
  URL               https://github.com/openresty/luajit2/archive/v2.1-20201229.tar.gz
  CONFIGURE_COMMAND ""
  BUILD_IN_SOURCE   true
  BUILD_COMMAND     make
  INSTALL_COMMAND   make install PREFIX=${luajitInstallDir}
)

set(lua515InstallDir ${CMAKE_CURRENT_BINARY_DIR}/lua515)
ExternalProject_Add(lua515
  URL               https://www.lua.org/ftp/lua-5.1.5.tar.gz
  CONFIGURE_COMMAND ""
  BUILD_IN_SOURCE   true
  BUILD_COMMAND     make linux
  INSTALL_COMMAND   make install INSTALL_TOP=${lua515InstallDir}
)

set(testdataInstallDir ${CMAKE_CURRENT_BINARY_DIR}/testdata)
ExternalProject_Add(testdata
  URL                 https://cs.fit.edu/~mmahoney/compression/enwik8.bz2
  DOWNLOAD_NO_EXTRACT true
  CONFIGURE_COMMAND   ""
  BUILD_COMMAND       ""
  INSTALL_COMMAND     ${CMAKE_COMMAND} -E make_directory ${testdataInstallDir}
  COMMAND             bzip2 -cd <SOURCE_DIR>/../enwik8.bz2 > ${testdataInstallDir}/enwik8
)
