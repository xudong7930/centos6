centos6 install vpn
===================

## 1.安装StrongSwan
```bash
yum -y install gmp-devel
wget http://download.strongswan.org/strongswan.tar.gz
tar xzf strongswan.tar.gz
cd strongswan-*
./configure --prefix=/usr/local/strongswan --sysconfdir=/usr/local/strongswan/etc  --enable-openssl --enable-nat-transport --disable-mysql --disable-ldap  --disable-static --enable-shared --enable-md4 --enable-eap-mschapv2 --enable-eap-aka --enable-eap-aka-3gpp2  --enable-eap-gtc --enable-eap-identity --enable-eap-md5 --enable-eap-peap --enable-eap-radius --enable-eap-sim --enable-eap-sim-file --enable-eap-simaka-pseudonym --enable-eap-simaka-reauth --enable-eap-simaka-sql --enable-eap-tls --enable-eap-tnc --enable-eap-ttls
make && make install
```

****

## 2.配置相关证书
client_key.sh
```bash
#!/bin/bash
info="usage:\n sh client_key.sh USER_NAME EMAIL \n Run this script in directory to store your keys"

if [ $1 ];  then
    if [ $2 ]; then
        NAME=$1
        MAIL=$2
        echo "generating keys for $NAME $MAIL ..."
    else
        echo $info
        exit 1
    fi
else
    echo $info
    exit 1
fi

mkdir -p private && mkdir -p cacerts && mkdir -p certs

keyfile="private/"$NAME"Key.pem"

certfile="certs/"$NAME"Cert.pem"

p12file=$NAME".p12"

strongswan pki --gen --type rsa --size 2048 \
    --outform pem \
    > $keyfile

strongswan pki --pub --in $keyfile --type rsa | \
    strongswan pki --issue --lifetime 730 \
    --cacert cacerts/strongswanCert.pem \
    --cakey private/strongswanKey.pem \
    --dn "C=CH, O=VULTR-VPS-CENTOS, CN=$MAIL" \
    --san $MAIL \
    --outform pem > $certfile

strongswan pki --print --in $certfile

echo "\nEnter password to protect p12 cert for $NAME"
openssl pkcs12 -export -inkey $keyfile \
    -in $certfile -name "$NAME's VPN Certificate" \
    -certfile cacerts/strongswanCert.pem \
    -caname "strongSwan Root CA" \
    -out $p12file

if [ $? -eq 0 ]; then
    echo "cert for $NAME at $p12file"
fi
```

server_key.sh
```bash
#!/bin/bash
if [ $1 ];  then
    CN=$1
    echo "generating keys for $CN ..."
else
    echo "usage:\n sh server_key.sh YOUR EXACT HOST NAME or SERVER IP\n Run this script in directory to store your keys"
    exit 1
fi

mkdir -p private && mkdir -p cacerts && mkdir -p certs

strongswan pki --gen --type rsa --size 4096 --outform pem > private/strongswanKey.pem
strongswan pki --self --ca --lifetime 3650 --in private/strongswanKey.pem --type rsa --dn "C=CH, O=VULTR-VPS-CENTOS, CN=$CN" --outform pem > cacerts/strongswanCert.pem
echo 'CA certs at cacerts/strongswanCert.pem\n'
strongswan pki --print --in cacerts/strongswanCert.pem

sleep 1
echo "\ngenerating server keys ..."
strongswan pki --gen --type rsa --size 2048 --outform pem > private/vpnHostKey.pem
strongswan pki --pub --in private/vpnHostKey.pem --type rsa | \
    strongswan pki --issue --lifetime 730 \
    --cacert cacerts/strongswanCert.pem \
    --cakey private/strongswanKey.pem \
    --dn "C=CH, O=VULTR-VPS-CENTOS, CN=$CN" \
    --san $CN \
    --flag serverAuth --flag ikeIntermediate \
    --outform pem > certs/vpnHostCert.pem
echo "vpn server cert at certs/vpnHostCert.pem\n"
strongswan pki --print --in certs/vpnHostCert.pem
```
> sh client_key.sh xudong7930 xudong7930@gmail.com  
> sh server_key.sh 45.32.77.118



## 3.配置StrongSwan
ipsec.conf
```bash
config setup
    uniqueids=never

conn ios_cert
    keyexchange=ikev1
    left=%defaultroute
    leftauth=psk
    leftsubnet=0.0.0.0/0
    right=%any
    rightauth=psk
    rightauth2=xauth
    rightsourceip=10.0.0.0/24
    auto=add
```

strongswan.conf
```bash
# strongswan.conf - strongswan configuration file
charon {
    load_modular = yes
    duplicheck.enable = no
    compress = yes
    plugins {
        include strongswan.d/charon/*.conf
    }
    dns1 = 8.8.8.8
    dns2 = 8.8.4.4
    # for windows only
    nbns1 = 8.8.8.8
    nbns2 = 8.8.4.4
    filelog {
        /var/log/strongswan.log {
            time_format = %b %e %T
            default = 2
            append = no
            flush_line = yes
        }
    }
}
include strongswan.d/*.conf
```

ipsec.secrets
```bash
# /etc/ipsec.secrets - strongSwan IPsec secrets file
: RSA server.pem
: PSK "123456"
xudong7930 %any : XAUTH "123456"
xudong7930 %any : EAP "123456"
```

## 4.配置转发及防火墙
编辑/etc/sysctl.conf
```bash
net.ipv4.ip_forward=1
net.ipv6.conf.all.forwarding=1
net.ipv4.conf.all.accept_redirects = 0
net.ipv4.conf.all.send_redirects = 0
```
iptables配置
```bash
iptables -A INPUT -p esp -j ACCEPT
iptables -A INPUT -p udp --dport 500 -j ACCEPT
iptables -A INPUT -p udp --dport 4500 -j ACCEPT
iptables -t nat -A POSTROUTING -s 10.0.0.0/24 -o enp7s0f0 -j MASQUERADE
```

****

## 5.启动
启动脚本
```bash
#!/bin/sh
#
# strongswan   An implementation of key management system for IPsec
#
# chkconfig:   - 48 52
# description: Starts or stops the Strongswan daemon.

### BEGIN INIT INFO
# Provides: ipsec
# Required-Start: $network $remote_fs $syslog $named
# Required-Stop: $syslog $remote_fs
# Default-Start:
# Default-Stop: 0 1 6
# Short-Description: Start Strongswan daemons at boot time
### END INIT INFO

# Source function library.
. /etc/rc.d/init.d/functions
exec="/usr/sbin/strongswan"
prog="strongswan"
status_prog="starter"
config="/usr/local/strongswan/etc/strongswan.conf"

lockfile=/var/lock/subsys/$prog

start() {
    [ -x $exec ] || exit 5
    [ -f $config ] || exit 6
    echo -n $"Starting $prog: "
    daemon $exec start
    retval=$?
    echo
    [ $retval -eq 0 ] && touch $lockfile
    return $retval
}

stop() {
    echo -n $"Stopping $prog: "
    $exec stop
    retval=$?
    echo
    [ $retval -eq 0 ] && rm -f $lockfile
    return $retval
}

restart() {
    stop
    start
}

reload() {
    restart
}

force_reload() {
    restart
}

_status() {
    # run checks to determine if the service is running or use generic status
    status $status_prog
}

_status_q() {
    _status >/dev/null 2>&1
}

case "$1" in
    start)
        _status_q && exit 0
        $1
        ;;
    stop)
        _status_q || exit 0
        $1
        ;;
    restart)
        $1
        ;;
    reload)
        _status_q || exit 7
        $1
        ;;
    force-reload)
        force_reload
        ;;
    status)
        _status
        ;;
    condrestart|try-restart)
        _status_q || exit 0
        restart
        ;;
    *)
        echo $"Usage: $0 {start|stop|status|restart|condrestart|try-restart|reload|force-reload}"
        exit 2
esac
exit $?
```
> /usr/local/strongswan/strongswan start|stop|restart
