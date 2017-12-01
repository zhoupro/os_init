#!/usr/bin/env bash




function idea(){
   if [ ! -d /opt/soft/dev/idea/$1 ] ;then
      python3.5  $current_dir/function/lib/download.py --soft $1
   fi
}

