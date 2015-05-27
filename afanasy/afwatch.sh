#!/bin/bash
pushd /NAS/renderfarm/cgru/afanasy
source setup.sh
GCC_VERSION=`gcc -dumpversion`
./bin_${GCC_VERSION}/afwatch