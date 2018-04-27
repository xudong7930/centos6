docker redis
============

https://hub.docker.com/_/redis/

## make dir
mkdir -p /usr/local/redisdb/data
wget -c -o /usr/local/redisdb/redis.conf http://download.redis.io/redis-stable/redis.conf

## download redis image
docker pull redis:latest

## create redis container
docker run -d --name redisnd -p 6379:6379 -v /usr/local/somedocker/redis/redis.conf:/etc/redis/redis.conf -v /usr/local/somedocker/redis/data:/data redis:latest redis-server /etc/redis/redis.conf

## start redis
docker start|stop|restart redisnd
