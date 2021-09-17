#!/bin/env bash

source envfs.sh
source package.sh
source url_package.sh

cd ../build

#curl $URL_GLIBC/$PACKAGE_GLIBC --output $PACKAGE_GLIBC
printf "\n##########################\n"
printf "#     Extracted Glibc    #\n"
printf "##########################\n"
tar xJf $PACKAGE_GLIBC
#rm $PACKAGE_GLIBC
cd $GLIBC

mkdir build
cd build

../configure --prefix=${ROOTFS} --with-headers=${ROOTFS}/usr/include --host=arm-linux-gnueabi

ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make -j $(grep 'cpu cores' /proc/cpuinfo | uniq |  awk '{print $4}')
ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make install