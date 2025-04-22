#!/bin/bash
set -eu -o pipefail; _wd=$(pwd); _dir=$(readlink -f `dirname "$0"`)

cd ${_dir}

container=$(yq .services.socks5_vpn.container_name compose.yaml)

docker exec -it $container bash
