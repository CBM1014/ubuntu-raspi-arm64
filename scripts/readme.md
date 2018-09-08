# About These Scripts

Please **DO NOT** run any script in this floder with sudo. Some values in these scripts was announced in ../build.sh. 

They may **SERIOUS DAMAGE YOUR HOST SYSTEM** or produce some useless file in your / floder if you runned them with root permission. 

It will makes you upset or full with unhappy. Don't do that.

**If you want to run these scripts, please fix the null value on the top of these scripts.**

environment.sh
---
This script will install some packages on your host system, for the purpose of make the build process going on smoothly.

image.sh
---
image.sh will help you to setup your vdisk, vpartitions and make file systems on these partitions.

**Notice: "Device path /dev/loopx is unavailable." means this device path is in use.**

**You can run `losetup -d /dev/loopx` to make these pathes reavailable.`**

rootfs.sh
---
This script will build the root floder of the system and install some basic packages.

boot.sh
---
This scriot will build the boot partition and install the most of firmwares. 

**CAUTION: RUNNING THIS SCRIPT WITHOUT FIX THE NULL PATH VALUE WILL CAUSE THE SERIOUS DAMAGE OF YOUR HOST SYSTEM.**

**IT WILL DELETE YOUR /boot FLODER, MAKE YOUR HOST SYSTEM CANNOT BOOT AS USUAL.**

kernel.sh
---
This script will build linux kernel, install the kernel, moudles, headers and some firmwares in your system. 

final.sh
---
final.sh will clean up your project floder and umount the vdisk.
