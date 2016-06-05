#!/usr/bin/env bash

route del default

ifconfig eth1 172.16.200.3 netmask 255.255.255.0
