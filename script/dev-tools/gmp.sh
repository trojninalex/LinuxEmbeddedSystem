#!/bin/env bash

cd ../

source envfs.sh
source package.sh
source url_package.sh

cd ../build

curl $URL_GCC_INFRASTRUCTURE/$PACKAGE_GMP --output $PACKAGE_GMP
tar xjf $PACKAGE_GMP
rm $PACKAGE_GMP
cd $GMP

printf "\nStart build gmp\n\n"
export CFLAGS="-O2 -pedantic -fomit-frame-pointer -march=armv7-a -mfloat-abi=softfp" 
./configure --prefix=/usr --host=arm-linux-gnueabi
ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make -j $(grep 'cpu cores' /proc/cpuinfo | uniq |  awk '{print $4}')
ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make check
ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- sudo make install DESTDIR=${ROOTFS}
