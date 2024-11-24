# Arch-Linux_firmware-mod-kit

How-to: Build firmware-mod-kit on Arch Linux or Arch Linux forks (e.g. Artix)

Clone this repo:
~~~
	$ cd $HOME
	$ git clone https://github.com/st-ty1/Arch-Linux_firmware-mod-kit.git
~~~
Clone firmware-mod-kit repo:
~~~
	$ cd $HOME
	$ git clone https://github.com/rampageX/firmware-mod-kit.git
~~~
Install tools needed by firmware-mod-kit:
( path to your local clone of firmware-mod-kit repo: FMK_DIR=$HOME/firmware-mod-kit 
  path to your local clone of Arch-Linux_firmware-mod-kit repo: FMK_PATH_DIR=$HOME/Arch-Linux_firmware-mod-kit )
~~~
	$ cd $FMK_DIR
	$ patch -p1 -d$FMK_DIR < $FMK_PATH_DIR/fmk.patch 
	$ cd src
	$ make
~~~
Install first part of prerequisites of binwalk, available in Arch repos::
~~~
	$ sudo pacman -S wget tar python python-virtualenv trizen git base-devel mtd-utils gzip bzip2 tar arj lhasa p7zip cabextract squashfs-tools zlib xz lzo sleuthkit unarchiver
	$ trizen -S cramfsswap
~~~
As the installation of the prerequisites of python2 from aur repo is broken and python3.12 of the arch repo is too fresh for binwalk, 
an older python3 version (e.g. python 3.8) has to be installed:
~~~
	$ trizen -S python38
~~~
Create a virtual environment for python and install pip inside:
~~~
	$ python -m virtualenv -p /usr/bin/python3.8 ~/python38
	$ source ~/python38/bin/activate
        (python38) $ python -m pip --version
~~~
Install binwalk:
~~~
	(python38) $ cd binwalk-2.1.1
	(python38) $ python setup.py install
~~~
Install python packages needed for binwalk:
~~~
	(python38) $ pip install scipy
	(python38) $ pip install pyqtgraph
	(python38) $ pip install capstone
	(python38) $ pip install numpy
	(python38) $ pip install pyqt5
	(python38) $ pip install jefferson
	(python38) $ pip install ubi_reader
        (python38) $ deactivate
~~~
Build and install cramfs, needed by binwalk:
~~~
	$ cd ~
	$ git clone https://github.com/davidribyrne/cramfs.git
	$ patch -p1 -dcramfs < $FMK_PATH_DIR/gcc14.patch
	$ cd cramfs 
	$ make
	$ sudo make install
~~~
Build and install sasquatch, needed by binwalk:
~~~
	$ cd ~
	$ git clone https://github.com/devttys0/sasquatch.git
	$ patch -p1 -dsasquatch/patches < $FMK_PATH_DIR/M1-Kali.patch
	$ cd sasquatch
	$ ./build.sh
~~~
That's it.
