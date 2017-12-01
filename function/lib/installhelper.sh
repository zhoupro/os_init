#!/usr/bin/env bash
#
#安装软件总控制器,调用分控制器
#
# $1  package name

function installhelper(){
     install_fun=$1
     shift
     install_args=$@
	 exact_file="function/${com_codename}${com_release}/${install_fun}.sh"
     echo $exact_file
	 if [[ $com_codename == "deepin" ]];then
	    exact_file="function/${com_codename}/${install_fun}.sh"
	 fi

	 common_file="function/common/${install_fun}.sh"


	 if [  -f "$exact_file" ]; then
	 	echo "Install  $install_fun from exact_file file "
        source "$exact_file"
        $install_fun $install_args
     elif [  -f "$common_file" ]; then
     	echo "Install  $install_fun from common file "
     	source "$common_file"
     	$install_fun $install_args
     else
     	echo "Your $install_fun install file is missing!!!"
     fi

}