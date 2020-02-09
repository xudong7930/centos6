#!/bin/bash

# source
echo > /etc/apk/repositories
echo '/media/cdrom/apks' >> /etc/apk/repositories
echo 'http://dl-cdn.alpinelinux.org/alpine/v3.9/main' >> /etc/apk/repositories
echo 'http://dl-cdn.alpinelinux.org/alpine/v3.9/community' >> /etc/apk/repositories

#
mkdir /root/.bin
mkdir /root/storage && chmod 777 /root/storage

## youtube-dl
wget https://yt-dl.org/downloads/latest/youtube-dl -O /root/.bin/youtube-dl
chmod a+rx /root/.bin/youtube-dl

## composer
wget https://getcomposer.org/composer-stable.phar -O /root/.bin/composer.phar
chmod a+rx /root/.bin/composer.phar
ln -s /root/.bin/composer.phar /root/.bin/composer

# packages
apk update
apk add wget curl vim jq htop zsh
apk add git nginx redis supervisor
apk add nodejs npm
apk add php7 php7-fpm php7-cli php7-common php7-json php7-pdo php7-xml php7-mcrypt php7-mbstring php7-phar
apk add python3 libsodium

# pip
pip install git+https://github.com/shadowsocks/shadowsocks.git@master

# nginx
mkdir /usr/local/www
chown nginx:nginx -R /usr/local/www


# ssh config
apk add openssh openssh-server

sed -i "s/#PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config
sed -i "s/#UseDNS.*/UseDNS no/g" /etc/ssh/sshd_config
sed -i "s/#Port.*/Port 30022/g" /etc/ssh/sshd_config

rc-service sshd restart
#ssh-keygen -b 4096 -t rsa

# redis config
sed -i "s/port 6379/port 63799/g" /etc/redis.conf
sed -i "s/# requirepass foobared/requirepass xudong7930/g" /etc/redis.conf
rc-service redis restart

# phpconfig
sed -i "s/expose_php = On/expose_php = Off/g" /etc/php7/php.ini
sed -i "s/max_execution_time = 30/max_execution_time = 60/g" /etc/php7/php.ini
#sed -i "s/;date.timezone =/date.timezone = 'Asia/Shanghai'/g" /etc/php7/php.ini
sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 1600M/g" /etc/php7/php.ini
sed -i "s/post_max_size = 8M/post_max_size = 1600M/g" /etc/php7/php.ini
rc-service php-fpm7 restart