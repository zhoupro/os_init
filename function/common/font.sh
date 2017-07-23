#!/usr/bin/env bash

font(){
   if [ ! -d /usr/share/fonts/myfonts ];
   then
       mkdir -p /usr/share/fonts/myfonts
       sudo cp conf/fonts/* /usr/share/fonts/myfonts/
       sudo chmod 644 /usr/share/fonts/myfonts/*
       cd /usr/share/fonts/myfonts/
       mkfontscale
       mkfontdir
       fc-cache -fv
       cd -
   fi

}

