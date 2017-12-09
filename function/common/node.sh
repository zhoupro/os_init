#!/usr/bin/env bash
function  node(){

    if [ ! -d /opt/soft/dev/node ] ;then
        sudo -u $login_user python3  $current_dir/function/lib/nodejs.py
        tar xvJf nodejs.tar.xz
        rm -rf /opt/soft/dev/node  nodejs.tar.xz
        mv node-v* /opt/soft/dev/node
        sed -i "/\/opt\/soft\/dev\/node\/bin/d" /etc/profile
        echo 'export PATH=$PATH:/opt/soft/dev/node/bin' >> /etc/profile
    fi
}
