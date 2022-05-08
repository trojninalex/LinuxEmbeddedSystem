#!/bin/env bash

cd ../

source envfs.sh
source package.sh
source url_package.sh

cd ../build

git clone $URL_OPENSSL $OPENSSL 
cd $OPENSSL
git checkout $OPENSSL_VER
git pull 

./Configure linux-armv4 --cross-compile-prefix=arm-linux-gnueabi- --prefix=${ROOTFS}
make 

