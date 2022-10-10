#!/bin/bash

sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    make

sudo chmod 777 /etc/resolv.conf
sudo echo "nameserver 8.8.8.8" >> /etc/resolv.conf
sudo chmod 755 /etc/resolv.conf

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

mkdir -p /home/seongjki/data
mkdir -p /home/seongjki/data/wp
mkdir -p /home/seongjki/data/db

sudo chmod 777 /etc/hosts
sudo echo "127.0.0.1 seongjki.42.fr" >> /etc/hosts
sudo chmod 755 /etc/hosts
