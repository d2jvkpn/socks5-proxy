#!/bin/bash
set -eu -o pipefail; _wd=$(pwd); _dir=$(readlink -f `dirname "$0"`)


interface=${interface:-tun0}

iptables -A INPUT -i "$interface" -m conntrack --ctstate NEW -j DROP

trap "iptables -D INPUT -i "$interface" -m conntrack --ctstate NEW -j DROP" EXIT

openvpn $@
