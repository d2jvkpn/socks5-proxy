#!/bin/bash
set -eu -o pipefail; _wd=$(pwd); _dir=$(readlink -f `dirname "$0"`)


exit
####
docker exec -it socks5-vpn supervisorctl status
# supervisorctl reread
# supervisorctl update

docker exec socks5_vpn curl https://icanhazip.com

curl -x sock5h://127.0.0.1:1090 https://ifconfig.me

curl -x sock5h://127.0.0.1:1090 https://icanhazip.com

# docker exec -it socks5-vpn bash

# docker exec -it socks5-vpn ssh -F configs/ssh.conf remote_host


exit 0
####
iptables -A INPUT -i tun0 -m conntrack --ctstate NEW -j DROP

iptables -L -n -v

iptables -D INPUT -i tun0 -m conntrack --ctstate NEW -j DROP

iptables -A INPUT -i tun0 -s 10.1.1.1 -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT


exit
####
interface=${interafce:-tun0}

addr=$(ip addr show dev "$interface" | awk '$1=="inet"{print $2}')
echo "==> addr: $addr"

nmap -sn $addr
