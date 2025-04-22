#!/bin/bash
set -eu -o pipefail; _wd=$(pwd); _dir=$(readlink -f `dirname "$0"`)


exit
docker exec -it socks5-vpn supervisorctl status
# supervisorctl reread
# supervisorctl update

docker exec socks5_vpn curl https://icanhazip.com

curl -x sock5h://127.0.0.1:1090 https://ifconfig.me

curl -x sock5h://127.0.0.1:1090 https://icanhazip.com

# docker exec -it socks5-vpn bash

# docker exec -it socks5-vpn ssh -F configs/ssh.conf remote_host
