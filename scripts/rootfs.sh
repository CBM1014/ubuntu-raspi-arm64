whereisme=$(pwd)
rm -rf rootfs
qemu-debootstrap --arch arm64 bionic rootfs $mirrorsite
rm $whereisme/rootfs/etc/resolv.comf
cat /etc/resolv.conf >> $whereisme/rootfs/etc/resolv.conf
$whereisme/rootfs/etc/apt/sources.list
cat  $whereisme/resources/sources.list >> $whereisme/rootfs/etc/apt/sources.list
chroot $whereisme/rootfs apt-get update
chroot $whereisme/rootfs apt-get install bash-completion resolvconf net-tools ethtool wireless-tools 
rm $whereisme/rootfs/etc/hostname
echo "raspberrypi" >> $whereisme/rootfs/etc/hostname
rm $whereisme/rootfs/etc/hosts
echo "127.0.0.1 localhost" >> $whereisme/rootfs/etc/hosts
echo "127.0.0.1 raspberrypi" >> $whereisme/rootfs/etc/hosts
rm $whereisme/rootfs/etc/fstab
cat $whereisme/resources/fstab >> $whereisme/rootfs/etc/fstab
echo "pi:$6$XE7qPeCU$iQbZgMmz.2PAo5NfFd62P9c8axT5HfZtGrw5Hd2TiAb37kakTgV7OxzRc62qEiMSgdECJezAOK1bYA.YkeEcp.:17771:0:99999:7:::" >> $whereisme/rootfs/etc/shadow
echo "pi:x:1000:1005:,,,:/home/pi:/bin/bash" >> $whereisme/rootfs/etc/passwd
rm $whereisme/rootfs/etc/network/interfaces
cat /resources/interfaces >> $whereisme/rootfs/etc/network/interfaces
