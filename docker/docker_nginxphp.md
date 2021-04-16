# nginx+php

#### docker hub
> https://registry.hub.docker.com/r/skiychan/nginx-php7

#### install
```sh
docker pull skiychan/nginx-php7:2.22.0

docker run --name app_nginx -p 80:80 -p 8080:8080 -p 9001:9001 -v /Users/xd/xudong/code:/data/wwwroot -v /Users/xd/xudong/docker/nginx/logs:/data/wwwlogs -v /Users/xd/xudong/docker/nginx/conf.d:/data/server/nginx/vhost -v /Users/xd/xudong/docker/nginx/php_ini:/data/server/php/ini -v /Users/xd/xudong/docker/nginx/php_extension:/data/server/php/extension -d skiychan/nginx-php7:2.22.0
```


#### 环境变量:
vi ~/.bash_profile
```
PATH=$PATH:$HOME/bin:/usr/local/php/bin:/usr/local/nginx/sbin
```


#### 安装扩展：

- redis
	http://pecl.php.net/get/redis-5.3.0.tgz

- xdebug
	https://xdebug.org/files/xdebug-3.0.4.tgz

```sh
/usr/local/php/bin/phpize && \
./configure --with-php-config=/usr/local/php/bin/php-config && \
make && make install
```


#### 配置文件
xdebug.ini
```
[xdebug]
zend_extension=/usr/local/php/lib/php/extensions/no-debug-non-zts-20121212/xdebug.so
xdebug.enable=1
xdebug.remote_enable=1
xdebug.remote_autostart=1
// vscode主机的地址 和 端口
xdebug.remote_host="192.168.125.146" 
xdebug.remote_port=19001
```



