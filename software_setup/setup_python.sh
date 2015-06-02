#!/bin/bash

if [ -f /opt/python2.7/bin/python ] 
then
    # custom Python 2.7 installation on CentOS
    export LD_LIBRARY_PATH=/opt/bhfx/lib:/opt/python2.7/lib:$LD_LIBRARY_PATH 
    export PATH=/opt/python2.7/bin:/opt/bhfx/bin:$PATH
elif [ -e /usr/lib/x86_64-linux-gnu/libpython2.7.so ]
then
	# Python 2.7 installation on Mint
	export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH
else
    # no custom Python 2.7 so we'll assume that we can just launch Houdini normally
    echo "No Python modding"
fi
