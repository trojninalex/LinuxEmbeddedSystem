#! /bin/sh

printf "\nInstall Cross Develop Tools\n" 
sudo apt install crossbuild-essential-armel crossbuild-essential-armhf crossbuild-essential-arm64 bison flex libssl-dev 

printf "\nInstall Develop Application\n"
sudo apt install emacs-nox git lynx

printf "\nInstall QEMU\n"
sudo apt install qemu qemu-system-x86 qemu-system-arm qemu-user-static qemu-user qemu-efi qemu-efi-arm qemu-efi-aarch64 qemu-system-mips 

printf "\n"