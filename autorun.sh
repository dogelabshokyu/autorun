#!/bin/bash
#For ubuntu 20.04
#install basic package
sudo apt-get install -y git curl wget zsh gir1.2-gtop-2.0 gir1.2-nm-1.0 gir1.2-clutter-1.0
#install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#Setup Build env
sudo apt-get install git-core gnupg flex bison build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig

#install Git-repo
mkdir ~/bin
PATH=~/bin:$PATH
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
#make repo can running on python3 well
sed -i 's/\/usr\/bin\/env python/\/usr\/bin\/env python3/' repo

#make dir for download AOSP source
cd ~/ && mkdir Android && cd Android 
mkdir aosp && mkdir los && mkdir rr && mkdir pe
echo Download Android 10.0 source
echo AOSP 10.0
cd aosp  && repo init -u https://android.googlesource.com/platform/manifest && cd ..
echo LineageOS 17.1
cd los && repo init -u git://github.com/LineageOS/android.git -b lineage-17.1 && cd ..
echo Resurrection Remix Q
cd rr && repo init -u https://github.com/ResurrectionRemix/platform_manifest.git -b Q && cd ..
echo Pixel Experience ten
cd pe && repo init -u https://github.com/ResurrectionRemix/platform_manifest.git -b Q && cd ..
echo sync all
repo sync
