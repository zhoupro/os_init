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

}

