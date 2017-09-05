docker redis
============

## make dir
mkdir -p /usr/local/redisdb/data
tocuh /usr/local/redisdb/redis.conf

## download redis image
docker pull redis:latest

## create redis container
docker run -p 30020:6379 --name redisnd -v /usr/local/redisdb/data:/data redis redis-server --appendonly yes 

## start redis
docker start|stop|restart redisnd
