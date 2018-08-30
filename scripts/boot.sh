"Building boot partition... It's a important part of the system. It will be completed quickly."
rm -rf $whereisme/boot
mkdir $whereisme/boot
cp -rv $whereisme/works/firmware/boot/* $whereisme/boot
rm -rf $whereisme/boot/.git
cp -rf $whereisme/works/firmware-nonfree/* $whereisme/rootfs/lib
rm -rf $whereisme /rootfs/lib/.git

