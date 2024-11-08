<h2>How to run byedpi with hev-socks5-tunnel</h2>

1) Download install.sh
2) Download byedpictl.sh
3) Go to the directory where you downloaded `install.sh` and make it executable `chmod +x install.sh`
4) Run `install.sh`
5) In your terminal, you need to run hev-socks5-tunnel first:

```
sudo /usr/local/bin/hev-socks5-tunnel /etc/byedpi/hev-socks5-tunnel.yaml 
```
Make sure the hev-socks5-tunnel created the network interface by the name of `byedpi-tun`. 
Check it with `id addr show`. 

```
byedpi-tun: <POINTOPOINT,MULTICAST,NOARP,UP,LOWER_UP> mtu 8500 qdisc pfifo_fast state UNKNOWN group default qlen 500
    link/none 
    inet 172.20.0.1/32 scope global byedpi-tun
       valid_lft forever preferred_lft forever
    inet6 fc00::1/128 scope global 
       valid_lft forever preferred_lft forever
    inet6 fe80::9539:c841:bfe5:90d/64 scope link stable-privacy proto kernel_ll 
       valid_lft forever preferred_lft forever
```
<b>If you do not see an interface with the name of `byedpi-tun` something is wrong and you must make it appear first.</b>

If you encounter a message saying `RTNETLINK answers: File exists` restart your machine and check that an interface `byedpi-tun` exists. If it's there you can continue.

6) Make `byedpictl.sh` executable `chmod +x byedpictl.sh`
7) Run `sudo ./byedpictl.sh tun start` to enable full traffic tunneling. That will tunnel `byedpi` obfuscated traffic through `hev-socks5-tunnel`. We can change `start` argument to `stop` or `restart`.

<h2>Conclusion</h2>

Now check that you have <b>both</b> `hev-socks5-tunnel` and `byedpi` running (we ran `byedpi` with the command in the 7th step, the script encapsulates it).

We can edit `byedpi` command options in `byedpictl.sh`: 

```
    nohup su - byedpi -s /bin/bash -c \
"ciadpi --ip 127.0.0.1 --port 4080 \
--proto=udp --udp-fake=2 \
--proto=http,tls --oob=2 \
--auto=torst --tlsrec 3+s \
--auto=torst --timeout=3" \
```

Find the combination that works for you and try to access resources such as Youtube and Discord.
