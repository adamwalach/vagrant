#!/bin/bash

iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT

iptables -F
iptables -F -t nat
iptables -F -t mangle
iptables -A INPUT -p tcp -s 10.0.2.0/24 --dport 22 -m comment --comment "VAGRANT" -j ACCEPT

iptables -A INPUT -s 10.10.10.5 -p tcp --sport 22 -j DROP
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -s 192.168.254.0/24 -p icmp --icmp-type 8 -j ACCEPT

iptables -A INPUT -s 10.10.10.5 -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -s 10.10.10.5 -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -s 10.10.10.5 -p tcp --dport 21 -j ACCEPT
iptables -A INPUT -s 10.10.10.5 -p udp --dport 53 -j ACCEPT
