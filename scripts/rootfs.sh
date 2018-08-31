if test -z "$whereisme"
then
  echo "Found null path value. please fix the path value before you run this script. See ./README.md and ./scripts/readme.md for more infomation."
  exit 1
fi
echo "Building rootfs(root floder)..."
rm -rf rootfs
qemu-debootstrap --arch arm64 bionic rootfs $mirrorsite
touch $whereisme/rootfs/etc/resolv.conf
cat /etc/resolv.conf >> $whereisme/rootfs/etc/resolv.conf
touch $whereisme/rootfs/etc/apt/sources.list
cat  $whereisme/resources/sources.list >> $whereisme/rootfs/etc/apt/sources.list
chroot $whereisme/rootfs apt-get update
chroot $whereisme/rootfs apt-get install bash-completion resolvconf net-tools ethtool wireless-tools 
touch $whereisme/rootfs/etc/hostname
echo "raspberrypi" >> $whereisme/rootfs/etc/hostname
touch $whereisme/rootfs/etc/hosts
echo "127.0.0.1 localhost" >> $whereisme/rootfs/etc/hosts
echo "127.0.0.1 raspberrypi" >> $whereisme/rootfs/etc/hosts
touch $whereisme/rootfs/etc/fstab
cat $whereisme/resources/fstab >> $whereisme/rootfs/etc/fstab
echo "pi:$6$XE7qPeCU$iQbZgMmz.2PAo5NfFd62P9c8axT5HfZtGrw5Hd2TiAb37kakTgV7OxzRc62qEiMSgdECJezAOK1bYA.YkeEcp.:17771:0:99999:7:::" >> $whereisme/rootfs/etc/shadow
echo "pi:x:1000:1005:,,,:/home/pi:/bin/bash" >> $whereisme/rootfs/etc/passwd
touch $whereisme/rootfs/etc/network/interfaces
cat /resources/interfaces >> $whereisme/rootfs/etc/network/interfaces
