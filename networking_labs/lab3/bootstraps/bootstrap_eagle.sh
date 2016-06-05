#!/usr/bin/env bash

echo "Bootstrap eagle!"

#applications
if [ ! -f /tmp/provisioned ]; then
	apt-get update
	apt-get install -y apache2 bind9 proftpd-basic
	service apache start
	touch /tmp/provisioned
fi

#routing
ip route del 0/0 #2&>1 >/dev/null
route add default gw 192.168.254.253
route -n
echo "IPs:"
ip addr | grep "scope global"

#firewall
mkdir -p /etc/firewall
cp -f /vagrant/bootstraps/common/disable.sh /etc/firewall/disable.sh
chmod 755 /etc/firewall/disable.sh

#cp -f /vagrant/bootstraps/eagle/firewall.sh /etc/firewall/firewall.sh
#chmod 755 /etc/firewall/firewall.sh /etc/firewall/disable.sh

#/etc/firewall/firewall.sh
/etc/firewall/disable.sh


echo "Finished eagle"
