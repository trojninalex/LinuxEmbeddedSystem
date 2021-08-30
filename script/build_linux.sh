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

