Hey! Read me! Here!
---
This project is not complete yet, please **do not run any script in the project** before this sentence being removed.
You can star this repo in order to let me know that there is a persion still look forward to this project, it will make me working harder on it <3

# ubuntu-raspi-arm64
It's a project which helps you to build Ubuntu18.04 for raspberrypi 3b+.

Notice: only raspberrypi 3b+ can use arm64 system. Don't build this system for older raspberrypi, it will spoil your time.

Introduction
---

**This script only works on x86(x86_64)Linux system.** 

You can build your own raspberrypi system with this script.

This raspi system based on **Ubuntu18.04**.

Default configurations:
---

User: `pi`

Password: `pi`

Apt mirror site: **Tsinghua University TUNA Association's mirror site** (China)

SSH: **enable** (on port 22)

Expand rootfs: **enable** (at the first boot)

raspi-config: **enable** (by command `raspi-config`)

Desktop environment: **disable** 

Build 
---
#### Requirements
+ Ubuntu 18.04

The Older verison of Ubuntu and Debian was not tested. I guess that this script would work on these systems.

If it workd on the system not listed here, please open an issue and tell me.

#### Compile
`sudo ./build.sh`

Notice: debootstrap is also using Tsinghua University TUNA Association's mirror site. 

You can edit `./build.sh` if you want to change it.

It's a value on the top of the file, easy to find.
