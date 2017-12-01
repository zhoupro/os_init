#!/usr/bin/env bash

#xxnet
xxnet(){

    if [ -d /opt/soft/xx-net ];then
        return
    fi

    git clone git://github.com/XX-net/XX-Net.git xx-net
    cd xx-net
    git checkout 3.3.1
    cd ..
    mkdir -p /opt/soft
    mv xx-net /opt/soft/
    (/opt/soft/xx-net/start &)
    sleep 6
    #杀死xx-net进程
    kill -9 $(ps -ef | grep  "python code/default/launcher/start.py" | grep -v grep | awk '{print $2}')
    cp conf/xx-net/manual.ini /opt/soft/xx-net/data/gae_proxy/
    sed -i 's,allow_remote_connect: 0,allow_remote_connect: 1,g'   /opt/soft/xx-net/data/launcher/config.yaml
}

