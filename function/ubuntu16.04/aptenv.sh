#!/usr/bin/env bash

# apt package
aptenv(){
  apt-get update
  #remove bug reporter since it's annoying
  apt-get remove  -y  apport
  apt-get  autoremove -y


  declare -a myarray
 
  myarray=(
              libnss3-tools python-gtk2 libffi-dev python-appindicator libnss3-tools  fcitx-table-wbpy
              apt-transport-https ca-certificates
              vim-gnome   git  filezilla  unrar p7zip    build-essential   cmake putty  python-pip
              shutter htop  synergy vlc uget ipython wget curl
              plasma-nm  iftop    okular kchmviewer kazam goldendict mypaint dia
         )


	
	for i in ${myarray[@]};
	do
	   if (( $(dpkg -l | awk '{print $2}' | grep ^$i | wc -l)==0 )) ;then
        echo Install $i
	      apt-get install -y $i;
	   fi

	done
}

