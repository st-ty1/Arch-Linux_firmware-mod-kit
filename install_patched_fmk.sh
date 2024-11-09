#! /bin/sh

# path to your local clone of repo of firmware-mod-kit https://github.com/rampageX/firmware-mod-kit.git
FMK_DIR=$HOME/firmware-mod-kit
# path to patch of firmware-mod-kit iof local clone of repo https://github.com/st-ty1/Arch-Linux_firmware-mod-kit.git
FMK_PATH_DIR=$HOME/Arch-Linux_firmware-mod-kit

rm -rf $FMK_DIR
cd $HOME
git clone https://github.com/rampageX/firmware-mod-kit.git
cd $FMK_DIR
git checkout master

patch -p1 -d$FMK_DIR < $FMK_PATH_DIR/fmk.patch 
cd src
make