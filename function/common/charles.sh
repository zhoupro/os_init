#!/usr/bin/env bash




function charles(){
    if [ ! -f /usr/bin/charles ];
    then
        wget -q -O - https://www.charlesproxy.com/packages/apt/PublicKey | sudo apt-key add -
        sudo sh -c 'echo deb https://www.charlesproxy.com/packages/apt/ charles-proxy main > /etc/apt/sources.list.d/charles.list'
        sudo apt-get update
        sudo apt-get install charles-proxy -y
    fi

}

