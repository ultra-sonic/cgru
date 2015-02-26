#!/bin/bash
echo "####### setup_vray.sh ########"


export VRAY_REPO=/opt/vray
export OS=`uname -s`

export VRAY_AUTH_CLIENT_FILE_PATH=${VRAY_REPO}
export VRAY_ROOT=${VRAY_REPO}/${VRAY_RELEASETYPE}/${VRAY_VERSION}/${OS}/${HOST_APPLICATION}/${HOST_APPLICATION_VERSION}

#VRAY 2.4 Maya
export VRAY_BIN_DIR=${VRAY_ROOT}/vray/bin
#VRAY 3.0 Max
#export VRAY_BIN_DIR=${VRAY_ROOT}/bin/linux_x64/gcc-4.4

export VRAY_PATH=${VRAY_PATH}:${VRAY_BIN_DIR}

#maybe unused
#export VRAY_SDK=${VRAY_ROOT}
#export VRAY_OSL_PATH_x64=${VRAY_SDK}/opensl


export VRAY_PLUGINS_x64=${VRAY_ROOT}/vray/vrayplugins

VRAY_PYTHONPATH=${VRAY_ROOT}/vray/scripts
export PYTHONPATH=$PYTHONPATH:$VRAY_PYTHONPATH

#export PATH=${VRAY_ROOT}/$OS/$MAYA_VERSION/lib:$PATH
export LD_LIBRARY_PATH=${VRAY_ROOT}/addon/lib/linux_x64/gcc-4.4:${VRAY_ROOT}/lib:$LD_LIBRARY_PATH
#export LD_LIBRARY_PATH=/opt/vray/official/24002/Linux/Maya/2015/addon/lib/linux_x64/gcc-4.4:$LD_LIBRARY_PATH
					   

#addon is for libcgauth.so

#export MAYA_DEBUG_ENABLE_CRASH_REPORTING=1
#export VRAY_TEXTURE_CACHE=8192
#echo VRAY_TEXTURE_CACHE = $VRAY_TEXTURE_CACHE
echo VRAY_RELEASETYPE = ${VRAY_RELEASETYPE}
echo VRAY_VERSION = ${VRAY_VERSION}
echo VRAY_BIN_DIR = $VRAY_BIN_DIR
echo LD_LIBRARY_PATH = $LD_LIBRARY_PATH