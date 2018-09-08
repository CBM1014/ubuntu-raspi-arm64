if [ `id -u` -ne 0 ];then
    echo "Please run this script with 'sudo' or by root user."
    exit 1
fi
if test -z "$whereisme"
then
  echo "Found null path value. please fix the path value before running this script. Check ./README.md and ./scripts/readme.md to get more infomation."
  exit 1
fi
echo "Installing qemu, debootstrap and gcc..."
apt-get install debootstrap qemu qemu-user-static bc build-essential make gcc g++ gcc-aarch64-linux-gnu git kpartx
echo "Clonging linux kernal source code and firmwares...It may takes a long time. Have a rest <3"
works="$whereisme/works"
linux="$whereisme/works/linux"
firmware="$whereisme/works/firmware"
firmware_nonfree="$whereisme/works/firmware-nonfree"
if [ ! -d "$works" ]; then
  mkdir $works
fi
if [ ! -d "$linux" ]; then
  git clone -b rpi-4.14.y --depth 1 https://github.com/raspberrypi/linux.git
  mv $whereisme/linux $works
else
  cd $works/linux
  git pull
  cd ..
fi
if [ ! -d "$firmware" ]; then
  git clone -b master --depth 1 https://github.com/raspberrypi/firmware.git
  mv $whereisme/firmware $works
else
  cd $works/firmware
  git pull
  cd ..
fi
if [ ! -d "$firmware_nonfree" ]; then
  git clone --depth 1 https://github.com/rpi-distro/firmware-nonfree.git
  mv $whereisme/firmware-nonfree $works
else
  cd $works/firmware-nonfree
  git pull
  cd ..
fi
echo "I'v prepared all the things we need. Let's do it!"

