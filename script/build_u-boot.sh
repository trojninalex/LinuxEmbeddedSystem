#!/bin/env bash

source envfs.sh
source package.sh
source url_package.sh

cd ../build

curl $URL_UBOOT/$PACKAGE_UBOOT --output $PACKAGE_UBOOT
printf "\n##########################\n"
printf "#    Extracted U-Boot    #\n"
printf "##########################\n"
tar xjf $PACKAGE_UBOOT
rm $PACKAGE_UBOOT
cd $UBOOT

ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make am335x_evm_defconfig 
ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make -j $(grep 'cpu cores' /proc/cpuinfo | uniq |  awk '{print $4}')
cp MLO ${BOOT}/MLO
cp u-boot.img ${BOOT}/u-boot.img