#!/usr/bin/env bash

echo 1 > /proc/sys/net/ipv4/ip_forward
route del default

#firewall
mkdir -p /etc/firewall
ln -s -f /vagrant/bootstraps/common/disable.sh /etc/firewall/disable.sh
chmod 755 /etc/firewall/disable.sh

ln -s -f /vagrant/bootstraps/bst2/firewall.sh /etc/firewall/firewall.sh

chmod 755 /etc/firewall/firewall.sh

/etc/firewall/firewall.sh
#/etc/firewall/disable.sh
