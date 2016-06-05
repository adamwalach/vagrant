#!/usr/bin/env bash

route del default

ifconfig eth1 192.168.255.3 netmask 255.255.255.0

