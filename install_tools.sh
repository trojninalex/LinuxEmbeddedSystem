#! /bin/sh

printf "\nInstall Cross Develop Tools\n\n" 
sudo apt install crossbuild-essential-armel crossbuild-essential-armhf crossbuild-essential-arm64 

printf "\nInstall Develop Application\n\n"
sudo apt install emacs-nox git 

printf "\n"
