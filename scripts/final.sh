if [ `id -u` -ne 0 ];then
    echo "Please run this script with 'sudo' or by root user."
    exit 1
fi
if test -z "$whereisme"
then
  echo "Found null path value. please fix the path value before running this script. Check ./README.md and ./scripts/readme.md to get more infomation."
  exit 1
fi
echo "Cleaning..."
sync
umount $whereisme/rootfs
umount $whereisme/rootfs/boot
losetup -d /dev/loop6
losetup -d /dev/loop7
rm -rvf $whereisme/rootfs
rm -f $whereisme/ubuntu-18.04-raspberrypi-arm64.img
mv -v $whereisme/image $whereisme/ubuntu-18.04-raspberrypi-arm64.img
sync
