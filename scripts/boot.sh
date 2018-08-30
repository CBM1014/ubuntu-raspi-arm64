mkdir $whereisme/boot
git clone https://github.com/raspberrypi/firmware.git
git clone https://github.com/rpi-distro/firmware-nonfree.git
cp -rv $whereisme/firmware/boot/* $whereisme/boot
rm -rf $whereisme/boot/.git
cp -rf $whereisme/firmware-nonfree/* $whereisme/rootfs/lib
rm -rf $whereisme /rootfs/lib/.git

