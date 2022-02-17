#!/bin/env bash

cd ../

source envfs.sh
source package.sh
source url_package.sh

cd ../build

curl $URL_BASH/$PACKAGE_BASH --output $PACKAGE_BASH
printf "\n#########################\n"
printf "#     Extracted Bash    #\n"
printf "#########################\n"
tar xzf $PACKAGE_BASH
rm $PACKAGE_BASH
cd $BASH

printf "\nStart build coreutils\n\n"

./configure --prefix=/ --host=arm-linux-gnueabihf
ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make -j $(grep 'cpu cores' /proc/cpuinfo | uniq |  awk '{print $4}')
ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- sudo make install DESTDIR=${ROOTFS}