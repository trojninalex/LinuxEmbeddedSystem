#!/bin/env bash

cd ../

source envfs.sh
source package.sh
source url_package.sh

cd ../build

curl $URL_GCC_INFRASTRUCTURE/$PACKAGE_MPC --output $PACKAGE_MPC
tar xf $PACKAGE_MPC
rm $PACKAGE_MPC
cd $MPC

printf "\nStart build mpfr\n\n"
./configure --prefix=/usr -host=arm-linux-gnueabi --with-gmp=${ROOTFS}/usr
ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make -j $(grep 'cpu cores' /proc/cpuinfo | uniq |  awk '{print $4}')
ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- sudo make install DESTDIR=${ROOTFS}
