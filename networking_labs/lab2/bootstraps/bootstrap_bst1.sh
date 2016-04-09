#!/usr/bin/env bash

echo "Bootstrap bst1!"

#applications
if [ ! -f /tmp/provisioned ]; then
	apt-get update
	apt-get install -y nmap
	touch /tmp/provisioned
fi

#routing
ip route del 0/0 
route -n
echo "IPs:"
ip addr | grep "scope global"

#firewall
mkdir -p /etc/firewall
cp -f /vagrant/bootstraps/common/disable.sh /etc/firewall/disable.sh

cp -f /vagrant/bootstraps/bst1/firewall.sh /etc/firewall/firewall.sh
chmod 755 /etc/firewall/firewall.sh /etc/firewall/disable.sh

#/etc/firewall/firewall.sh
/etc/firewall/disable.sh

echo "Finished bst2!"
