# 启动PHP,注意挂载的目录要一致
> dk run --rm --name phpnd -p 9000:9000 -v /usr/local/www:/usr/local/www:rw php:7.1-fpm
