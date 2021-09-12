#!/bin/sh

source package.sh
source url_package.sh

cd ../build

curl $URL_LINUX_KERNEL/$PACKAGE_LINUX_KERNEL --output $PACKAGE_LINUX_KERNEL
printf "##########################\n"
printf "# Extracted Linux kernel #\n"
printf "##########################\n"
tar xJf $PACKAGE_LINUX_KERNEL
rm $PACKAGE_LINUX_KERNEL
cd $LINUX_KERNEL

#make ARCH=arm multi_v7_defconfig
make ARCH=arm omap2plus_defconfig
ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- make -j $(grep 'cpu cores' /proc/cpuinfo | uniq |  awk '{print $4}') zImage
make ARCH=arm dtbs
ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- make -j $(grep 'cpu cores' /proc/cpuinfo | uniq |  awk '{print $4}') modules
#ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- make -j $(grep 'cpu cores' /proc/cpuinfo | uniq |  awk '{print $4}') INSTALL_MOD_PATH=/patch/to/rootfs modules_install
