#!/bin/bash

echo "1" > /proc/sys/net/ipv4/ip_forward

iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT

iptables -F
iptables -F -t nat
iptables -F -t mangle

iptables -A INPUT -p tcp -s 10.0.2.0/24 --dport 22 -m comment --comment "VAGRANT" -j ACCEPT

iptables -A INPUT -p tcp -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp -s 192.168.254.254 --dport 22 -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -j DROP

iptables -A INPUT -i eth1 -p icmp --icmp-type echo-request -j ACCEPT

iptables -A INPUT -i eth1 -m mac --mac-source 08:00:27:ac:88:23 -j DROP
