if test -z "$whereisme"
then
  echo "Found null path value. please fix the path value before running this script. See ./README.md and ./scripts/readme.md for more infomation."
  exit 1
fi
echo "Building linux kernel...It may takes a long time, but shouter than clone git repos. Have a cup of coffee~"
cd $whereisme/works/linux
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- bcmrpi3_defconfig
make -j 4 ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-
cd $whereisme
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- INSTALL_MOD_PATH=$whereisme/rootfs modules_install
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- INSTALL_HDR_PATH=$whereisme/rootfs/usr headers_install
rm $whereisme/boot/*kernel*
rm $whereisme/boot/*.dtb
cp -v $whereisme/works/linux/arch/arm64/boot/Image $whereisme/boot/kernel8.img
cp -v $whereisme/works/linux/arch/arm64/boot/dts/broadcom/*.dtb $whereieme/boot
touch $whereisme/boot/config.txt
echo "kernel=kernel8.img" >> $whereisme/boot/config.txt
