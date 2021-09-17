#!/bin/env bash

source envfs.sh
source package.sh
source url_package.sh

cd ../build

curl $URL_MUSL/$PACKAGE_MUSL --output $PACKAGE_MUSL
printf "\n##########################\n"
printf "#     Extracted Musl     #\n"
printf "##########################\n"
tar zxf $PACKAGE_MUSL
rm $PACKAGE_MUSL
cd $MUSL

CC="arm-linux-gnueabi-gcc -static -march=armv7-a -marm -mfpu=neon -mtune=cortex-a8" \
./configure --target=arm-linux-gnueabi-gcc --prefix=/usr --exec_prefix=/usr

ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make -j $(grep 'cpu cores' /proc/cpuinfo | uniq |  awk '{print $4}')
ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make prefix=${ROOTFS}/usr exec_prefix=${ROOTFS}/usr syslibdir=${ROOTFS}/lib install
