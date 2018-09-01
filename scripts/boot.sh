if test -z "$whereisme"
then
  echo "Found null path value. please fix the path value before running this script. See ./README.md and ./scripts/readme.md for more infomation."
  exit 1
fi
"Building boot partition... It's a important part of the system. It will be completed quickly."
cp -rv $whereisme/works/firmware/boot/* $whereisme/boot
rm -rf $whereisme/boot/.git
cp -rf $whereisme/works/firmware-nonfree/* $whereisme/rootfs/lib
rm -rf $whereisme/rootfs/lib/.git

