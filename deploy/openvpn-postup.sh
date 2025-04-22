#!/bin/bash

exit 0

iptables -A INPUT -i tun0 -m conntrack --ctstate NEW -j DROP

iptables -L -n -v

iptables -D INPUT -i tun0 -m conntrack --ctstate NEW -j DROP

iptables -A INPUT -i tun0 -s 10.1.1.1 -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
