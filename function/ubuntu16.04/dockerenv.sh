#!/usr/bin/env bash

#docker devevlop enviroment
dockerenv(){
pip install --upgrade pip
if (( $( which docker | wc -l)==0 )) ;then

	curl -sSL https://get.daocloud.io/docker | sh
	sudo service docker start
	sudo groupadd docker
	sudo usermod -aG docker $uname
fi

if (( $( which docker-compose | wc -l)==0 )) ;then
	pip install -U docker-compose
fi


if (( $(cat /lib/systemd/system/docker.service  | grep 0.0.0.0:4243 | wc -l)==0 )) ;then
   sudo sed -i -e 's#/usr/bin/dockerd -H fd://#/usr/bin/dockerd -H fd://  -H tcp://0.0.0.0:4243 --dns 180.76.76.76 --dns 8.8.8.8#g' /lib/systemd/system/docker.service
fi





}

