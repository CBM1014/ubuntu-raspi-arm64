if [ `id -u` -ne 0 ];then
    echo "Please run this script with 'sudo' or by root user."
    exit 1
fi
if test -z "$whereisme"
then
  echo "Found null path value. please fix the path value before running this script. Check ./README.md and ./scripts/readme.md to get more infomation."
  exit 1
fi
echo "Building boot partition... It's a important part of the system. It will be completed quickly."
cd $whereisme
cp -rv $whereisme/works/firmware/boot/* $whereisme/boot
rm -rf $whereisme/rootfs/boot/.git
mkdir $whereisme/rootfs/lib
cp -rv $whereisme/works/firmware-nonfree $whereisme/rootfs/lib
rm -rf $whereisme/rootfs/lib/firmware-nonfree/.git
mv -v $whereisme/rootfs/lib/firmware-nonfree $whereisme/rootfs/lib/firmware


