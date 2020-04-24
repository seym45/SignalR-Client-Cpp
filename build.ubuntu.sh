#!/bin/bash 
SIGNALRCLIENT_BUILD_DIR=build.$AC_PLATFORM
if [[ ! -d ${SIGNALRCLIENT_BUILD_DIR} ]]; then
    mkdir ${SIGNALRCLIENT_BUILD_DIR}
fi
cd ${SIGNALRCLIENT_BUILD_DIR}
rm -rf *


PLATFORM_ROOT=$SIGNALR_ROOT/.build_ubuntu
BOOST_ROOT=${PLATFORM_ROOT}/boost-1.61-ubuntu
CPPRESDSDK_ROOT=${PLATFORM_ROOT}/cpprest

command="cmake ..  -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=false -DBUILD_SAMPLES=true \
  -DUSE_CPPRESTSDK=true
  -DBUILD_SHARED_LIBS=0  \
  -DBoost_NO_BOOST_CMAKE=TRUE \
  -DBoost_NO_SYSTEM_PATHS=TRUE \
  -DCPPREST_STATIC_LIBRARY_DIR=${CPPRESDSDK_ROOT}/lib \
  -DCPPREST_LIBRARY_DIR=${CPPRESDSDK_ROOT}/lib \
  -DCPPREST_INCLUDE_DIR=${CPPRESDSDK_ROOT}/include \
  -DBOOST_ROOT=${BOOST_ROOT} \
  -DBOOST_INCLUDEDIR=${BOOST_ROOT}/include \
  -DBoost_INCLUDE_DIR=${BOOST_ROOT}/include \
  -DBoost_SYSTEM_LIBRARY=${BOOST_ROOT}/stage/lib/libboost_system-gcc-mt-1_61.a \
  -DBOOST_LIBRARYDIR=${BOOST_ROOT}/stage/lib "

echo $command
$command

make -j$NCPU