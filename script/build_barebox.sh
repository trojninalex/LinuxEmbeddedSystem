#!/bin/sh

source package.sh
source url_package.sh

cd ../build

curl $URL_BAREBOX/$PACKAGE_BAREBOX --output $PACKAGE_BAREBOX
printf "\n##########################\n"
printf "#   Extracted Barebox    #\n"
printf "##########################\n"
tar xjf $PACKAGE_BAREBOX
rm $PACKAGE_BAREBOX
cd $BAREBOX

ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- make am335x_mlo_defconfig 
ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- make -j $(grep 'cpu cores' /proc/cpuinfo | uniq |  awk '{print $4}')
ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- make omap_defconfig
ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- make -j $(grep 'cpu cores' /proc/cpuinfo | uniq |  awk '{print $4}')
