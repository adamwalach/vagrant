#!/bin/bash

iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

iptables -F

iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp -s 10.0.2.0/24 --dport 22 -m comment --comment "VAGRANT" -j ACCEPT

iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

iptables -A FORWARD -p icmp --icmp-type 8 -s 172.16.0.0/16 -m length --length 1000: -j DROP

iptables -A FORWARD -d 172.16.255.0/24 -p icmp --icmp-type 8 -m limit --limit 1/min --limit-burst 2 -j ACCEPT
iptables -A FORWARD -d 172.16.200.0/24 -p icmp --icmp-type 8 -m limit --limit 1/min --limit-burst 2 -j ACCEPT

iptables -A FORWARD -p tcp -d 192.167.254.254--dport 22 -m connlimit --connlimit-above 1 REJECT --reject-with tcp-reset

iptables -A FORWARD -s 172.16.255.0/24 -p tcp --dport 22 -j ACCEPT
iptables -A FORWARD -s 172.16.255.0/24 -p tcp --dport 80 -j ACCEPT
iptables -A FORWARD -s 172.16.255.0/24 -p tcp --dport 21 -j ACCEPT
iptables -A FORWARD -s 172.16.255.0/24 -p tcp --dport 53 -j ACCEPT

iptables -A FORWARD -s 172.16.200.0/24 -p tcp --dport 80 -j ACCEPT
iptables -A FORWARD -s 172.16.200.0/24 -p tcp --dport 53 -j ACCEPT
