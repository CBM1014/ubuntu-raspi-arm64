whereisme=$(pwd)
mirrorsite=http://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/
chmod +x $whereisme/scripts/*.sh
whereisme=$whereisme $whereisme/scripts/environment.sh
whereisme=$whereisme $whereisme/scripts/image.sh
whereisme=$whereisme $whereisme/scripts/boot.sh
whereisme=$whereisme $whereisme/scripts/rootfs.sh
whereisme=$whereisme $whereisme/scripts/kernel.sh
whereisme=$whereisme $whereisme/scripts/final.sh
