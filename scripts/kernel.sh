if [ `id -u` -ne 0 ];then
    echo "Please run this script with 'sudo' or by root user."
    exit 1
fi
if test -z "$whereisme"
then
  echo "Found null path value. please fix the path value before running this script. Check ./README.md and ./scripts/readme.md to get more infomation."
  exit 1
fi
echo "Building linux kernel...It may takes a long time, but shouter than clone git repos. Have a cup of coffee~"
cd $whereisme/works/linux
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- bcmrpi3_defconfig
make -j 4 ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- INSTALL_MOD_PATH=$whereisme/rootfs modules_install
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- INSTALL_HDR_PATH=$whereisme/rootfs/usr headers_install
cd $whereisme
rm $whereisme/rootfs/boot/*kernel*
rm $whereisme/rootfs/boot/*.dtb
cp -v $whereisme/works/linux/arch/arm64/boot/Image $whereisme/rootfs/boot/kernel8.img
cp -v $whereisme/works/linux/arch/arm64/boot/dts/broadcom/*.dtb $whereisme/rootfs/boot/
touch $whereisme/rootfs/boot/config.txt
echo "kernel=kernel8.img" >> $whereisme/rootfs/boot/config.txt
