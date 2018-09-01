if test -z "$whereisme"
then
  echo "Found null path value. please fix the path value before running this script. See ./README.md and ./scripts/readme.md for more infomation."
  exit 1
fi
echo "Parpareing the empty system image(3000M)..."
dd if=/dev/zero of=$whereisme/image bs=1M count=3000
echo "Setup the empty image..."
fdisk image < $whereisme/resources/fdisk-command
sudo -av kpartx $whereisme/image
echo "Making vfat file system for boot partition..."
mkfs.vfat /dev/mapper/$(ls /dev/mapper | grep p1)
echo "Making ext4 file system for rootfs partition..."
mkfs.ext4 /dev/mapper/$(ls /dev/mapper | grep p2)
echo "Mounting the image..."
rm -rf $whereisme/rootfs
rm -rf $whereisme/boot
mkdir $whereisme/rootfs
mkdir $whereisme/boot
mount /dev/mapper/$(ls /dev/mapper | grep p2) $whereisme/rootfs
mount /dev/mapper/$(ls /dev/mapper | grep p1) $whereisme/boot



