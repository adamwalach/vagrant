#!/usr/bin/env bash

echo "Bootstrap docker!"

echo 'PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"' > /etc/environment
echo 'LC_ALL="en_US.utf8"' >> /etc/environment

apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list

apt-get update
apt-get -y install docker-engine mc nmap links
