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
#
# change mirror server
# setup build env for android build
#
#########################################

#########################################
#
#	export shell variables
#
#	CMD_V_... : variable
#	CMD_F_... : file name
#	CMD_D_... : directory name
#
#########################################
export CMD_V_ANDROID_VERSION=
export CMD_V_AOSP_YN=
export CMD_V_LOS_YN=
export CMD_V_RR_YN=
export CMD_V_RR_YN=
export CMD_V_PACKAGE_INSTALL=

export CMD_D_TOP=~/
export CMD_D_ANDROID_HOME=~/Android
export CMD_D_AOSP=$CMD_D_ANDROID_HOME/AOSP

#########################################
#
#	define functions
#
#	FUNC_... : funcion
#
#########################################

function FUNC_help()
{
	cat <<EOF
=================================
=		TEST		=
=================================
EOF
}

function FUNC_PACKAGE()
{
	while[ -z $CMD_V_PACKAGE_INSTALL ]
	do
		clear
		echo "********************************************************************************"
		echo "			Did you wanna install Basic Package? (Y/N)		"
		echo "********************************************************************************"
		read $CMD_V_PACKAGE_INSTALL
	done

	echo "Install Package : $CMD_V_PACKAGE_INSTALL"
	echo
	exit


#change mirror server to kakao
sudo sed -i 's/kr.archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list
sudo apt-get update

#Setup build env
sudo apt-get install -y bc bison bison build-essential build-essential ccache clang curl curl curl flex fontconfig g++-multilib g++-multilib gcc-multilib gcc-multilib gir1.2-clutter-1.0 gir1.2-gtop-2.0 gir1.2-nm-1.0 git git git-core gnupg gnupg gperf gperf imagemagick lib32ncurses5-dev lib32ncurses5-dev lib32readline-dev lib32z1-dev lib32z1-dev libc6-dev-i386 libgl1-mesa-dev liblz4-tool liblz4-tool libncurses5 libncurses5-dev libsdl1.2-dev libssl-dev libx11-dev libxml2 libxml2-utils libxml2-utils libxml2-utils lzop m4 make openjdk-8-jdk pngcrush python rsync schedtool squashfs-tools unzip unzip wget x11proto-core-dev xsltproc xsltproc zip zip zlib1g-dev zlib1g-dev zlib1g-dev:i386 zsh
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

#make dir for download Android source
cd ~/ && mkdir Android && cd Android 

mkdir -p AOSP/10
echo AOSP 10.0
cd AOSP/10  && repo init -u https://android.googlesource.com/platform/manifest -b android-10.0.0_r46 && cd ..

mkdir -p LOS/17.1
echo LineageOS 17.1
cd LOS/17.1 && repo init -u git://github.com/LineageOS/android.git -b lineage-17.1 && cd ..

mkdir -p RR/Q
echo Resurrection Remix Q
cd RR/Q && repo init -u https://github.com/ResurrectionRemix/platform_manifest.git -b Q && cd ..

mkdir -p PE/ten
echo Pixel Experience ten
cd PE/ten && repo init -u repo init -u https://github.com/PixelExperience/manifest -b ten && cd ..

echo sync all
repo sync


