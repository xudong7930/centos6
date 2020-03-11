# 启动PHP,注意挂载的目录要一致
> dk run --rm --name php7-fpm -p 9000:9000 -v /usr/local/www:/usr/local/www:rw php:7.1-fpm

# php5.6
> docker run --rm --name php5-fpm -d  -p 127.0.0.1:9002:9000 -v /var/www/html:/var/www/html php:5.6-fpm

# php7.4
> docker run --rm --name php74-fpm -d  -p 127.0.0.1:9003:9000 -v /var/www/html:/var/www/html capino/php7.4-fpm

# 进入docker
docker exec --it php74-fpm bash