#!/bin/env bash

source envfs.sh

mkdir -p ${BOOT}
mkdir -p ${ROOTFS}
cd ${ROOTFS}

mkdir bin boot dev etc home lib media mnt opt proc root sbin sys tmp usr var
mkdir usr/bin usr/lib usr/sbin
mkdir var/log

sudo chown -R root:root *
sudo mknod -m 666 ${ROOTFS}/dev/null c 1 3
sudo mknod -m 600 ${ROOTFS}/dev/console c 5 1
