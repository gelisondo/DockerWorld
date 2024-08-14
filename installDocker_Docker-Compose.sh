#!/bin/bash

#Soy Root?
IDUSER=`id -u`
#Compara que no sea igual a cero.
if [ $IDUSER -ne 0 ];
then
	echo "Debe ser una cuenta administrador para ejecutar este script"
	exit
fi

apt update &&  apt upgrade -y

# Add Docker's official GPG key:
 apt-get update
 apt-get install ca-certificates curl

SOVERSION=`lsb_release -cs`

 
 install -m 0755 -d /etc/apt/keyrings
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
 chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
   tee /etc/apt/sources.list.d/docker.list > /dev/null

 apt-get update

apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

systemctl enable docker

