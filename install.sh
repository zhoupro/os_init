#!/usr/bin/env bash
###########
#环境搭建脚本
#author:prozhou
#email:zhoushengzheng@gmail.com
###########


current_dir="$(dirname $0)"
login_user=$(who|awk '{print $1}')

#读取参数
source "$current_dir/function/lib/readinput.sh"

#系统信息
source "$current_dir/function/lib/systeminfo.sh"

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

# since it takes too time, you can use it with -b1
if [ "1"$ifdockerbuild = "11" ] ;then
    installhelper  dockerbuild
fi

installhelper selenium
# install idea ide
installhelper idea phpstorm
installhelper idea pycharm
installhelper idea datagrip
installhelper idea webstorm
installhelper idea idea
installhelper idea clion
installhelper idea rubymine
installhelper idea goland
installhelper  node
installhelper  go
installhelper androidstudio


































