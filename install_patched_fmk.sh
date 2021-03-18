#! /bin/sh

# path to your local repo of firmware-mod-kit
FMK_DIR=$HOME/firmware-mod-kit
# path to patch of firmware-mod-kit
FMK_PATH_DIR=$HOME/Documents/firmware-mod-kit

rm -rf $FMK_DIR
cd $HOME
git clone https://github.com/rampageX/firmware-mod-kit.git
cd $FMK_DIR
git checkout master
dos2unix $FMK_DIR/src/others/squashfs-3.4-cisco/squashfs-tools/mksquashfs.c
patch -p1 -d$FMK_DIR < $FMK_PATH_DIR/gcc10.patch 
cd src
./configure
make
