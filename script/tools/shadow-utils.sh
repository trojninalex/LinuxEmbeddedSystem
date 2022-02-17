cd ../

source envfs.sh
source package.sh
source url_package.sh

cd ../build

git clone $URL_SHADOW $SHADOW 
cd $SHADOW
git checkout $SHADOW_VER
git pull 

printf "\nStart build shadow-utils\n\n"

./autogen.sh --prefix=/usr --host=arm-linux-gnueabihf --without-selinux
ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make -j $(grep 'cpu cores' /proc/cpuinfo | uniq |  awk '{print $4}')
printf "\nInstall!!!\n\n"
ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make install DESTDIR=${ROOTFS}