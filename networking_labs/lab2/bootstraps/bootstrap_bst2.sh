#!/usr/bin/env bash

echo "Bootstrap bst2!"

#applications
if [ ! -f /tmp/provisioned ]; then
	apt-get update
	apt-get install -y nmap links
	touch /tmp/provisioned
fi

#routing
ip route del 0/0 
route add default gw 10.10.10.6
route -n
echo "IPs:"
ip addr | grep "scope global"

#firewall

#network
echo "nameserver 192.168.254.254" > /etc/resolv.conf

echo "Finished bst2!"
