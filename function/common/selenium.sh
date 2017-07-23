#!/usr/bin/env bash


function selenium_is_installed(){
   if [ -d /opt/soft/dev/selenium/phantomjs ] ;then
        return 0
    else
        return 1
    fi
}

function selenium_proxy(){
    return 0
}


function selenium(){
    selenium_proxy
    res=`echo $?`
    if [ $res = "0"  ] && [ "1"$ifproxy != "11" ] ;then
        echo "selenium need proxy"
        return 1
    fi


    selenium_is_installed
    res=`echo $?`
    if [ $res = "1" ]; then
        sudo apt-get install -y python3-pip
        pip3 install selenium bs4
        mkdir -p /opt/soft/dev/selenium/
        wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2
        tar xjvf phantomjs-2.1.1-linux-x86_64.tar.bz2
        mv phantomjs-2.1.1-linux-x86_64  /opt/soft/dev/selenium/phantomjs
        sed -i "/\/opt\/soft\/dev\/selenium\/phantomjs\/bin/d" /etc/profile
        echo 'export PATH=$PATH:/opt/soft/dev/selenium/phantomjs/bin' >> /etc/profile
        pxy wget https://chromedriver.storage.googleapis.com/2.29/chromedriver_linux64.zip
        unzip chromedriver_linux64.zip
        mv chromedriver  /opt/soft/dev/selenium/chromedriver

    fi

}

sed -i "#/opt/soft/dev/phantomjs/bin#d" /etc/profile

function selenium_uninstall(){

    echo ''
}







