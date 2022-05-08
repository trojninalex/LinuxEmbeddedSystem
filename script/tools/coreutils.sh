#!/bin/env bash

cd ../

source envfs.sh
source package.sh
source url_package.sh

cd ../build

curl $URL_COREUTILS/$PACKAGE_COREUTILS --output $PACKAGE_COREUTILS
printf "\n##############################\n"
printf "#     Extracted CoreUtils    #\n"
printf "##############################\n"
tar xJf $PACKAGE_COREUTILS
rm $PACKAGE_COREUTILS
cd $COREUTILS

printf "\nStart build coreutils\n\n"

./configure --prefix=/usr --host=arm-linux-gnueabihf
ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make -j $(grep 'cpu cores' /proc/cpuinfo | uniq |  awk '{print $4}')
ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- sudo make install DESTDIR=${ROOTFS}