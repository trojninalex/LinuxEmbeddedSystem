#!/bin/env bash

source envfs.sh
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

make ARCH=arm omap2plus_defconfig
ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- make -j $(grep 'cpu cores' /proc/cpuinfo | uniq |  awk '{print $4}') zImage
make ARCH=arm dtbs
ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- make -j $(grep 'cpu cores' /proc/cpuinfo | uniq |  awk '{print $4}') modules

sudo cp arch/arm/boot/zImage ${ROOTFS}/boot/
sudo cp arch/arm/boot/dts/am335x-boneblack.dtb ${ROOTFS}/boot/
ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- sudo make -j $(grep 'cpu cores' /proc/cpuinfo | uniq |  awk '{print $4}') INSTALL_MOD_PATH=${ROOTFS} modules_install
ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- sudo make headers_install INSTALL_HDR_PATH=${ROOTFS}/usr
