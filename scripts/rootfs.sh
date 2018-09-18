mirrorsite=http://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/
if [ `id -u` -ne 0 ];then
    echo "Please run this script with 'sudo' or by root user."
    exit 1
fi
if test -z "$whereisme"
then
  echo "Found null path value. please fix the path value before running this script. Check ./README.md and ./scripts/readme.md to get more infomation."
  exit 1
fi
echo "Building root file system..."
qemu-debootstrap --arch arm64 bionic $whereisme/rootfs $mirrorsite
touch $whereisme/rootfs/etc/resolv.conf
cat /etc/resolv.conf >> $whereisme/rootfs/etc/resolv.conf
touch $whereisme/rootfs/etc/apt/sources.list
cat  $whereisme/resources/sources.list >> $whereisme/rootfs/etc/apt/sources.list
chroot $whereisme/rootfs apt-get update
chroot $whereisme/rootfs apt-get install raspi-config bash-completion resolvconf net-tools ethtool wireless-tools
cd $whereisme/rootfs
wget "https://archive.raspberrypi.org/debian/pool/main/f/firmware-nonfree/firmware-brcm80211_20161130-3+rpi2_all.deb"
chroot $whereisme/rootfs dpkg -i firmware-brcm80211_20161130-3+rpi2_all.deb
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
cat $whereisme/resources/interfaces >> $whereisme/rootfs/etc/network/interfaces
