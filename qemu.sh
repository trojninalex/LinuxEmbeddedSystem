#!/bin/sh

qemu-system-arm -machine vexpress-a9 -m 512M -drive file=root.ext4,sd\
		-net nic -net use -kernel zImage -dtb vexpress-v2p-ca9.dtb\
		-append "console=ttyAMA0,112500,root=/devmmcblk0"\
		-serial stdio -net nic, model=lan9118 -net tta, ifname=tap0
