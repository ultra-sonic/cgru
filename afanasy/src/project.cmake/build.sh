#!/bin/bash

# Get sources folder:
pushd .. > /dev/null
src=$PWD

# Get distribution variables:
cd ../..
cgru=$PWD
cd utilities
source ./getrevision.sh $src
[ -z "${DISTRIBUTIVE}" ] && source ./distribution.sh > /dev/null

# Go to initial folder:
popd > /dev/null

# Process options:
options=""
sql="REQUIRED"
gui="YES"
for arg in "$@"; do
	[ $arg == "--nosql" ] && sql="NO" && shift
	[ $arg == "--nogui" ] && gui="NO" && shift
done

# Configure SQL:
export AF_POSTGRESQL=$sql

# Configure GUI:
export AF_GUI=$gui

cgru_python="${cgru}/python"
if [ -d "${cgru_python}" ]; then
	export AF_PYTHON_INCLUDE_PATH="/opt/local//Library/Frameworks/Python.framework/Versions/2.7/include"
	export AF_PYTHON_LIBRARIES="/opt/local//Library/Frameworks/Python.framework/Versions/2.7/lib/libpython2.7.dylib"
fi


# Configure building:
export AF_ADD_CFLAGS=""
export AF_ADD_LFLAGS="-lutil"
export AF_EXTRA_LIBS=""

echo "Building on '${DISTRIBUTIVE}'"
case ${DISTRIBUTIVE} in
    openSUSE)
        export AF_ADD_LFLAGS="$AF_ADD_LFLAGS -lpthread"
        ;;
    SUSE)
        export AF_ADD_LFLAGS="$AF_ADD_LFLAGS -lpthread -ldl"
        ;;
    Debian)
        export ADD_CMAKE_MODULE_PATH="$PWD"
        ;;
    Gentoo)
        ;;
    Ubuntu)
        export ADD_CMAKE_MODULE_PATH="$PWD"
        export AF_EXTRA_LIBS="pthread"
        ;;
    Mint)
        export ADD_CMAKE_MODULE_PATH="$PWD"
        export AF_EXTRA_LIBS="pthread"
        ;;
    Fedora)
        export AF_ADD_LFLAGS="$AF_ADD_LFLAGS -lpthread"
        ;;
    AltLinux)
        export ADD_CMAKE_MODULE_PATH="$PWD"
        export AF_EXTRA_LIBS="pthread"
        ;;
    CentOS)
        export ADD_CMAKE_MODULE_PATH="$PWD"
        export AF_EXTRA_LIBS="pthread"
        ;;
    RedHat)
        export AF_ADD_LFLAGS="$AF_ADD_LFLAGS -lpthread -ldl"
        ;;
    Mageia)
        export AF_EXTRA_LIBS="pthread"
        ;;
    MacOSX)
        export AF_PYTHON_INCLUDE_PATH="/opt/local//Library/Frameworks/Python.framework/Versions/2.7/include/python2.7/"
        export AF_PYTHON_LIBRARIES="/opt/local//Library/Frameworks/Python.framework/Versions/2.7/lib/libpython2.7.dylib"
	;;
    *)
        echo "Warning: Untested system: '${DISTRIBUTIVE}'"
        ;;
esac

# Build:
cmake . && make $@
