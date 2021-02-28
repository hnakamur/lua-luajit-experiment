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

ExternalProject_Add(lua542openssl
  GIT_REPOSITORY    https://github.com/zhaozg/lua-openssl
  GIT_TAG           bcbad2d59435c741a1d92bb92b6d89a276719c15
  INSTALL_DIR       ${lua542InstallDir}
  CONFIGURE_COMMAND ""
  BUILD_IN_SOURCE   true
  BUILD_COMMAND     make PREFIX=<INSTALL_DIR>
  INSTALL_COMMAND   make install PREFIX=<INSTALL_DIR>
)
ExternalProject_Add_StepDependencies(lua542openssl build lua542)

ExternalProject_Add(luajithmac
  URL https://github.com/jkeys089/lua-resty-hmac/archive/193232acecb8bc15ee414651a53b11a1624e6a16.tar.gz
  CONFIGURE_COMMAND ""
  BUILD_COMMAND     ""
  INSTALL_DIR       ${luajitInstallDir}
  INSTALL_COMMAND   ${CMAKE_COMMAND} -E make_directory <INSTALL_DIR>/lib/resty
  COMMAND           ${CMAKE_COMMAND} -E copy <SOURCE_DIR>/lib/resty/hmac.lua <INSTALL_DIR>/lib/resty/
  COMMAND           echo return {} > <INSTALL_DIR>/lib/resty/string.lua
)
ExternalProject_Add_StepDependencies(luajithmac build luajit)

add_subdirectory(source)
