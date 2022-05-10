#!/bin/env bash

cd ../

source envfs.sh
source package.sh
source url_package.sh

cd ../build

git clone $URL_GCC $GCC 
cd $GCC
git checkout $GCC_VER
git pull 

./configure --host=arm-linux-gnueabi
#ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- make -j $(grep 'cpu cores' /proc/cpuinfo | uniq |  awk '{print $4}')
#ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- make install DESTDIR=${ROOTFS}
