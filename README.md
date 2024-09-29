# socks5 ssh
---
*local socks5 proxy through ssh*

#### C01. App
1. configuration(configs/local.yaml)
```yaml
proxy:
  ssh_address: remote_host:22
  ssh_user: account
  ssh_password: password
  ssh_private_key: /home/account/.ssh/id_rsa
  ssh_known_hosts: /home/account/.ssh/known_hosts
  socks5_user: hello
  socks5_password: world
```

2. compile
```bash
make build
ls target/main
```

3. run
```bash
./target main -debug -config=configs/local.yaml -addr=:1080
```

#### C02. Usage
1. commandlines with socks5 proxy
```bash
proxy=socks5://hello:world@127.0.0.1:1080

https_proxy=$proxy git pull

https_proxy=$proxy curl -4 https://icanhazip.com
curl -x "$proxy" https://icanhazip.com
```

2. web browser with sock5 proxt
**neither firefox or chromium support socks5 with auth**
```bash
proxy=socks5://127.0.0.1:1080

chromium --disable-extensions --incognito --proxy-server="$proxy"

# mannual config proxy in settings of firefox
firefox -p proxy
```
