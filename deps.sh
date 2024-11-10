#!/bin/bash

# wget tar python git base-devel 
# mtd-utils gzip bzip2 tar arj lhasa 
# p7zip cabextract squashfs-tools zlib
# xz lzo sleuthkit unarchiver (unstuff)
# python-pip python-opengl python-numpy python-scipy"
# aur: jefferson cramfsprogs cramfsswap ubi_reader
# aur: ?? libqt4-opengl python-pyqt4

sudo pacman -S wget tar python trizen git base-devel mtd-utils gzip bzip2 tar arj lhasa p7zip cabextract squashfs-tools zlib xz lzo sleuthkit python-pip python-opengl python-numpy python-scipy python-pyqtgraph python-capstone unarchiver
trizen -S jefferson cramfsprogs cramfsswap 
# trizen -S libqt4-opengl python-pyqt4

cd ~
git clone https://github.com/devttys0/sasquatch
(cd sasquatch && make && sudo make install)
rm -rf sasquatch
