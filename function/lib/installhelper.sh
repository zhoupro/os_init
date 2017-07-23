#!/usr/bin/env bash
#
#安装软件总控制器,调用分控制器
#
# $1  package name



function installhelper(){

	 exact_file="function/${com_codename}${com_release}/${1}.sh"
	 common_file="function/common/${1}.sh"
	 echo $common_file $exact_file

	 if [  -f "$exact_file" ]; then
	 	echo "Install  $1 from exact_file file "
        source "$exact_file"
        $1
     elif [  -f "$common_file" ]; then
     	echo "Install  $1 from common file "
     	source "$common_file"
     	$1
     else
     	echo "Your $1 install file is missing!!!"
     fi

}