#!/usr/bin/env bash

export http_proxy=http:172.17.0.1:8087
export https_proxy=http:172.17.0.1:8087



starttime=`date +'%Y-%m-%d %H:%M:%S'`
#执行程序
$*

endtime=`date +'%Y-%m-%d %H:%M:%S'`
start_seconds=$(date --date="$starttime" +%s);
end_seconds=$(date --date="$endtime" +%s);
echo "use time： "$((end_seconds-start_seconds))"s"
unset http_proxy
unset https_proxy


