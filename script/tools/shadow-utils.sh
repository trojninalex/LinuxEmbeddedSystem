#!/bin/env bash

cd ../

source envfs.sh
source package.sh
source url_package.sh

cd ../build

git clone $URL_SHADOW $SHADOW 
cd $SHADOW
git checkout $SHADOW_VER
git pull 

printf "\nStart build shadow-utils\n\n"

./autogen.sh --prefix=${ROOTFS} --with-sysroot=${ROOTFS} --host=arm-linux-gnueabi --without-selinux
#ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- make -j $(grep 'cpu cores' /proc/cpuinfo | uniq |  awk '{print $4}')
printf "\nInstall!!!\n\n"
#ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- make install DESTDIR=${ROOTFS}
