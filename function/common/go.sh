#!/usr/bin/env bash
function  go(){
    if  [ "1"$ifproxy == "11" ] ;then
        if [ ! -d /opt/soft/dev/go ] ;then
            bash function/lib/pxy.sh wget  --no-check-certificate $(sudo -u $login_user python3  $current_dir/function/lib/go.py) -O go.tar.gz
            tar xzvf go.tar.gz
            rm -rf go.tar.gz /opt/soft/dev/go
            mv go /opt/soft/dev/
            sed -i "/export GOROOT=\/opt\/soft\/dev\/go/d" /etc/profile
            echo 'export GOROOT=/opt/soft/dev/go' >> /etc/profile
            sed -i ":/$GOROOT\/bin/d" /etc/profile
            echo 'export PATH=$PATH:$GOROOT/bin' >> /etc/profile
        fi
    fi


}
