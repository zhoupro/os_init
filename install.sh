#!/usr/bin/env bash
###########
#环境搭建脚本
#author:prozhou
#email:zhoushengzheng@gmail.com
###########

#目录名称cd


if [ $UID -ne 0 ]; then
    echo "Superuser privileges are required to run this script."
    echo "e.g. \"sudo $0\""
    exit 1
fi

current_dir="$(dirname $0)"




#参数说明函数
function helper(){
    echo "-h: help info";
    echo "-p: enable proxy"

}

if ( ! getopts "hp" opt); then
	echo "Usage: `basename $0` options (-hp) -h for help";
fi

while getopts "hp" opt;
do
     case $opt in
         h) helper;exit 1;;
         p)  ifproxy=1;;

     esac
done


#系统信息
source "$current_dir/function/lib/systeminfo.sh"
systeminfo

echo "Your system is $com_codename $com_release"
echo "Install beginning"

#安装控制器
source "$current_dir/function/lib/installhelper.sh"
installhelper  xxnet
installhelper  font
installhelper  jdk
installhelper  charles
installhelper  aptenv
installhelper  dockerenv
installhelper  dockerbuild
installhelper selenium



# install idea ide
myarray=(phpstorm pycharm datagrip webstorm idea clion webstorm  rubymine)

for i in ${myarray[@]};
do
   if [ ! -d /opt/soft/dev/idea/$i ] ;then
      python3.5  $current_dir/function/common/download.py --soft $i
   fi
done



if [ "1"$ifproxy = "11" ] ;then
    sudo -u prozhou python3.5  $current_dir/function/common/androidstudio.py
    unzip android.zip
    mv android-studio /opt/soft/dev/idea/android-studio
fi

































