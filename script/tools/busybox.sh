#!/bin/env bash

source envfs.sh
source package.sh
source url_package.sh

cd ../build

curl $URL_BUSYBOX/$PACKAGE_BUSYBOX --output $PACKAGE_BUSYBOX
printf "\n##########################\n"
printf "#   Extracted BusyBox    #\n"
printf "##########################\n"
tar xjf $PACKAGE_BUSYBOX
rm $PACKAGE_BUSYBOX
cd $BUSYBOX

echo "Manually specify a static build!"
sleep 5

ARCH=arm CROSS_COMPILE=arm-linux-gnueabi-  \
make menuconfig


ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf-   \
make -j $(grep 'cpu cores' /proc/cpuinfo | uniq |  awk '{print $4}')

ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf-   \
make CONFIG_PREFIX=$ROOTFS install
