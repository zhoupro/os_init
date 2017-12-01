#!/usr/bin/env bash


function selenium_is_installed(){
   if [ -d /opt/soft/dev/selenium/phantomjs ]  ;then
        return 1
    else
        return 0
    fi
}

function chromedriver_is_installed(){
   if  [ -f /opt/soft/dev/selenium/chromedriver ] ;then
        return 1
    else
        return 0
    fi
}



function selenium(){

    if  [ "1"$ifproxy != "11" ] ;then
        echo "selenium need proxy"
        return 1
    fi

    selenium_is_installed
    res=`echo $?`
    if [ $res = "0" ]; then
        sudo apt-get install -y python3-pip
        pip3 install selenium bs4
        mkdir -p /opt/soft/dev/selenium/
        wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2
        tar xjvf phantomjs-2.1.1-linux-x86_64.tar.bz2
        rm -f phantomjs-2.1.1-linux-x86_64.tar.bz2
        mv phantomjs-2.1.1-linux-x86_64  /opt/soft/dev/selenium/phantomjs
        sed -i "/\/opt\/soft\/dev\/selenium\/phantomjs\/bin/d" /etc/profile
        echo 'export PATH=$PATH:/opt/soft/dev/selenium/phantomjs/bin' >> /etc/profile
    fi

    chromedriver_is_installed
    res=`echo $?`
    if [ $res = "0" ]; then
        bash function/lib/pxy.sh wget https://chromedriver.storage.googleapis.com/2.29/chromedriver_linux64.zip --no-check-certificate
        unzip chromedriver_linux64.zip
        rm -f chromedriver_linux64.zip
        mv chromedriver  /opt/soft/dev/selenium/chromedriver

    fi

    if [ ! -f  /usr/local/bin/geckodriver ]; then
        wget https://github.com/mozilla/geckodriver/releases/download/v0.19.1/geckodriver-v0.19.1-linux64.tar.gz
        tar xzvf geckodriver-v0.19.1-linux64.tar.gz
        rm -f geckodriver-v0.19.1-linux64.tar.gz
        mv geckodriver /usr/local/bin/geckodriver

    fi






}

sed -i "#/opt/soft/dev/phantomjs/bin#d" /etc/profile

function selenium_uninstall(){

    echo ''
}







