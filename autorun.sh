#!/bin/bash
#For ubuntu 20.04

#########################################
#					#
#		 Autorun		#
#					#
#########################################
# 2020-10-03	: by Kim Hokyu
#########################################

#########################################
# change mirror server
# setup build env for android build
#########################################



#change mirror server to kakao
sudo sed -i 's/kr.archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list
sudo apt-get update

#Setup build env
sudo apt-get install -y git curl wget zsh gir1.2-gtop-2.0 gir1.2-nm-1.0 gir1.2-clutter-1.0 python bc build-essential ccache curl g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5-dev libsdl1.2-dev libssl-dev libxml2 libxml2-utils lzop m4 openjdk-8-jdk pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev bison gperf libxml2-utils make zlib1g-dev:i386 liblz4-tool libncurses5 unzip clang git-core gnupg flex bison build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig

#install Git-repo
mkdir ~/bin
PATH=~/bin:$PATH
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
#make repo can running on python3 well
sed -i 's/\/usr\/bin\/env python/\/usr\/bin\/env python3/' bin/repo

#Download and install Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

#make dir for download AOSP source
cd ~/ && mkdir Android && cd Android 

mkdir -p AOSP/10
echo AOSP 10.0
cd AOSP/10  && repo init -u https://android.googlesource.com/platform/manifest && cd ..

mkdir -p LOS/17.1
echo LineageOS 17.1
cd LOS/17.1 && repo init -u git://github.com/LineageOS/android.git -b lineage-17.1 && cd ..

echo Resurrection Remix Q
cd rr && repo init -u https://github.com/ResurrectionRemix/platform_manifest.git -b Q && cd ..

echo Pixel Experience ten
cd pe && repo init -u repo init -u https://github.com/PixelExperience/manifest -b ten && cd ..

echo sync all
repo sync
