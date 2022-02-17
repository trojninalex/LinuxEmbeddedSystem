#! /bin/sh

printf "\nInstall Cross Develop Tools\n" 
sudo apt -y install crossbuild-essential-armel crossbuild-essential-armhf crossbuild-essential-arm64 gcc-arm-none-eabi bison flex \
                    libssl-dev gawk lzop rsync bc libncurses-dev dwarves autoconf autopoint gettext libtool

printf "\nInstall Develop Application\n"
sudo apt -y install emacs-nox git lynx curl

printf "\nInstall QEMU\n"
sudo apt -y install qemu qemu-system-x86 qemu-system-arm qemu-user-static qemu-user qemu-efi qemu-efi-arm qemu-efi-aarch64 qemu-system-mips 

printf "\n"
