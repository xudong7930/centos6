#!/bin/bash
#
# install_php.sh - this script install php automatic
#
# chkconfig:   - 85 15
# description: how to install php soft
#

# install dependency package
yum -y install libxml2 libxml2-devel libcurl libcurl-devel libjpeg libjpeg-devel libpng libpng-devel freetype freetype-devel glibc glibc-devel glib2 glib2-devel ncurses openssl openssl-devel libmcrypt libmcrypt-devel bzip2 bzip-delv zlib zlib-devel libicu libicu-devel mhash mhash-devel

# install mcrypt
wget ftp://mcrypt.hellug.gr/pub/crypto/mcrypt/attic/libmcrypt/libmcrypt-2.5.7.tar.gz
tar -zxf libmcrypt-2.5.8.tar.gz
cd libmcrypt-2.5.8 && ./configure && make && make install
cd ../ && rm -fr libmcrypt*

# install php
wget http://jp2.php.net/distributions/php-5.6.20.tar.gz
tar -zxf php-5.6.20.tar.gz
cd php-5.6.20

./configure --prefix=/usr/local/php --with-libdir=lib64 --enable-fpm --enable-mysqlnd --with-mysqli=mysqlnd --with-pdo-mysql=mysqlnd --enable-opcache --enable-pcntl --enable-mbstring --enable-soap --enable-zip --enable-bcmath --enable-exif --enable-ftp --enable-intl --enable-maintainer-zts --with-openssl --with-config-file-path=/usr/local/php/etc --with-zlib --with-curl --with-gd --with-zlib-dir=/usr/lib --with-png-dir=/usr/lib --with-jpeg-dir=/usr/lib --with-freetype-dir=/usr/lib --with-mhash

make && make install

# create php.ini and php-fpm.conf file
cp php.ini-production /usr/local/php/etc/php.ini
cp /usr/local/php/etc/php-fpm.conf.default /usr/local/php/etc/php-fpm.conf

# php-fpm
cp sapi/fpm/init.d.php-fpm /etc/init.d/php-fpm
chmod +x /etc/init.d/php-fpm

# start your php-fpm
/etc/init.d/php-fpm start

# check status
netstat -antp | grep php-fpm

echo "done!"
