#!/usr/bin/env bash

#docker devevlop enviroment
dockerenv(){

if (( $( which docker | wc -l)==0 )) ;then
	curl -sSL https://get.daocloud.io/docker | sh
	sudo service docker start
	sudo groupadd docker
	sudo usermod -aG docker $uname
fi

if (( $( which docker-compose | wc -l)==0 )) ;then
	pip install -U docker-compose
fi


sudo sed -i -e 's/#DOCKER_OPTS="--dns 8.8.8.8 --dns 8.8.4.4"/DOCKER_OPTS="--dns 180.76.76.76 --dns 8.8.8.8 -H tcp:\/\/127.0.0.1:4243 -H unix:\/\/\/var\/run\/docker.sock"/g' /etc/default/docker

}

