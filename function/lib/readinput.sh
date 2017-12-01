#!/usr/bin/env bash
# check root
if [ $UID -ne 0 ]; then
    echo "Superuser privileges are required to run this script."
    echo "e.g. \"sudo $0\""
    exit 1
fi
#参数说明函数
function helper(){
    echo "-h: help info";
    echo "-p: enable proxy";
    echo "-b: enable docker build"

}
ifhelp=0
ifproxy=0
ifdockerbuild=0


while getopts "hpb" opt;
do
     case $opt in
         h) helper;exit 1;;
         p)  ifproxy=1;;
         b)  ifdockerbuild=1;;
     esac
done