if [ `id -u` -ne 0 ];then
    echo "Please run this script with 'sudo' or by root user."
    exit 1
fi
if test -z "$whereisme"
then
  echo "Found null path value. please fix the path value before running this script. Check ./README.md and ./scripts/readme.md to get more infomation."
  exit 1
fi
echo "Parpareing the empty system image(3000M)..."
if [ -f "$whereisme/image" ]; then
  rm $whereisme/image
fi

dd if=/dev/zero of=$whereisme/image bs=1M count=3000
echo "Setup the image file..."
fdisk $whereisme/image < $whereisme/resources/fdisk-command
losetup --offset 1048576 --sizelimit 103809536 /dev/loop6 $whereisme/image
if [ $? -ne 0 ]; then
    echo "Device path /dev/loop6 is unavailable. Check the paragraph about image.sh in ./scripts/readme.md to get more imfomation."
    exit 1
fi

losetup --offset 105906176 /dev/loop7 $whereisme/image
if [ $? -ne 0 ]; then
    echo "Device path /dev/loop7 is unavailable. Check the paragraph about image.sh in ./scripts/readme.md to get more imfomation."
    exit 1
fi
echo "Making vfat file system for boot partition..."
mkfs.vfat /dev/loop6
echo "Making ext4 file system for rootfs partition..."
mkfs.ext4 /dev/loop7
echo "Mounting the image..."
rm -rf $whereisme/rootfs
mkdir $whereisme/rootfs
mkdir $whereisme/rootfs/boot
mount /dev/loop6 $whereisme/rootfs/boot
mount /dev/loop7 $whereisme/rootfs


