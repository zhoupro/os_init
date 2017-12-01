#!/usr/bin/env bash
function  go(){

    if [ ! -d /opt/soft/dev/go ] ;then
        sudo -u prozhou python3.5  $current_dir/function/lib/go.py
        tar xzvf go.tar.gz
        rm -rf go.tar.gz /opt/soft/dev/go
        mv go /opt/soft/dev/
        sed -i "/export GOROOT=\/opt\/soft\/dev\/go/d" /etc/profile
        echo 'export GOROOT=/opt/soft/dev/go' >> /etc/profile
        sed -i ":/$GOROOT\/bin/d" /etc/profile
        echo 'export PATH=$PATH:$GOROOT/bin' >> /etc/profile
    fi
}