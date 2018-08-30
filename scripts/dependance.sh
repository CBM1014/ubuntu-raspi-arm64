echo "Installing qemu, debootstrap and gcc..."
apt-get install debootstrap qemu qemu-user-static bc build-essential make gcc g++ gcc-aarch64-linux-gnu git
echo "Clonging linux kernal source code and firmwares...It may takes a long time. Have a rest <3"
git clone -b rpi-4.14.y https://github.com/raspberrypi/linux.git
git clone https://github.com/raspberrypi/firmware.git
git clone https://github.com/rpi-distro/firmware-nonfree.git
mkdir works
mv -v $whereisme/firmware $whereisme/works/firmware
mv -v $whereisme/firmware-nonfree $whereisme/works/firmware-nonfree
mv -v $whereisme/linux $whereisme/works/linux
echo "I'v prepared all the things we need. Let's do it!"
