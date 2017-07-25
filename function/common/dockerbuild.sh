#!/bin/bash

dockerbuild(){


    if [  ! -f ~/.config/dockerproxy/inslock ] && [ "1"$ifproxy = "11" ];then
        echo 'make docker proxy'
        mkdir -p  ~/.config/dockerproxy
        touch ~/.config/dockerproxy/inslock
        mkdir -p /etc/systemd/system/docker.service.d

        cat >> /etc/systemd/system/docker.service.d/http-proxy.conf <<END
[Service]
Environment="HTTP_PROXY=http:/172.17.0.1:8087/" "HTTPS_PROXY=https://172.17.0.1:8087/"
END

        cat /opt/soft/xx-net/data/gae_proxy/CA.crt >>/etc/ssl/certs/ca-certificates.crt
        systemctl daemon-reload
        systemctl restart docker
    else
        rm -rf /etc/systemd/system/docker.service.d/http-proxy.conf
        systemctl daemon-reload
        systemctl restart docker
    fi


    if [ ! -d ./docker-images ];then
        git clone https://github.com/zhouzheng12/docker-imges.git
    fi
    declare -a myarray
    myarray=(
        cs_6_nginx_1.4.4 cs_6_php_5.3.29 cs_6_php_7.1.3 dn_mysql_5.6 uu_14.04_vsftpd uu_14.04_django_1.11
            )

    for i in ${myarray[@]};
    do
    if (( $(docker images  | awk '{print $1}' | grep ^prozhou/$i | wc -l)==0 )) ;then
      docker build -t prozhou/$i  docker-imges/$i/
    fi
    done

}

