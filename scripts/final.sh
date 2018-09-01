if test -z "$whereisme"
then
  echo "Found null path value. please fix the path value before running this script. See ./README.md and ./scripts/readme.md for more infomation."
  exit 1
fi
echo "Installing rootfs resizing script..."
cat $whereisme/resources/init_resize >> $whereisme/rootfs/root/init_resize.sh
cat $whereisme/resources/cmdline.txt >> $whereisme/boot/cmdline.txt
echo "Cleaning..."
sync
umount $whereisme/rootfs
umount $whereisme/boot
kpartx -dv $whereisme/image
