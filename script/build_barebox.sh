#!/bin/env bash

source envfs.sh
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

cp ../../env/barebox/boot.mmc ./defaultenv/defaultenv-2-base/boot/mmc
cp ../../env/barebox/boot.usb ./defaultenv/defaultenv-2-base/boot/usb
cp ../../env/barebox/boot.sdcard ./defaultenv/defaultenv-2-base/boot/sdcard
cp ../../env/barebox/boot.nfs ./defaultenv/defaultenv-2-base/boot/nfs
cp ../../env/barebox/nv.boot.default ./defaultenv/defaultenv-2-base/nv/boot.default

ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make am335x_mlo_defconfig 
ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make -j $(grep 'cpu cores' /proc/cpuinfo | uniq |  awk '{print $4}')
cp images/barebox-am33xx-beaglebone-mlo.img ${BOOT}/MLO

ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make omap_defconfig
ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make -j $(grep 'cpu cores' /proc/cpuinfo | uniq |  awk '{print $4}')
cp images/barebox-am33xx-beaglebone.img ${BOOT}/barebox.bin
