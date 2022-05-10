#!/bin/env bash

cd ../

source envfs.sh
source package.sh
source url_package.sh

cd ../build

curl $URL_GCC_INFRASTRUCTURE/$PACKAGE_MPFR --output $PACKAGE_MPFR
tar xjf $PACKAGE_MPFR
rm $PACKAGE_MPFR
cd $MPFR

printf "\nStart build mpfr\n\n"
./configure --prefix=/usr --host=arm-linux-gnueabi
#ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make -j $(grep 'cpu cores' /proc/cpuinfo | uniq |  awk '{print $4}')
#ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- sudo make install DESTDIR=${ROOTFS}
