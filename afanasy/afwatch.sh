#!/bin/bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
pushd $DIR
source setup.sh
GCC_VERSION=`gcc -dumpversion`
./bin_${GCC_VERSION}/afwatch
