docker redis
============



<!-- linux 安装 -->
https://hub.docker.com/_/redis/

## make dir
mkdir -p /usr/local/redisdb/data
wget -c -o /usr/local/redisdb/redis.conf http://download.redis.io/redis-stable/redis.conf

## download redis image
docker pull redis:latest
docker pull redis:5.0.9

## create redis container
docker run -d --name app_redis503 -p 6380:6379 -v /usr/local/somedocker/redis/redis.conf:/etc/redis/redis.conf -v /usr/local/somedocker/redis/data:/data redis:latest redis-server

docker run --name app_redis503 -p 6380:6379 redist:5.0.9 --requirepass 123456

## start redis
docker start|stop|restart app_redis503


<!-- mac 安装 -->
```
mkdir -p /Users/xd/xudong/docker/redis/data

wget -c -o /Users/xd/xudong/docker/redis/redis.conf http://download.redis.io/redis-stable/redis.conf

docker pull redis:5.0.9

docker run -d --name app_redis -p 6379:6379 -v /Users/xd/xudong/docker/redis/redis.conf:/etc/redis/redis.conf -v /Users/xd/xudong/docker/redis/data:/data redis:5.0.9

```

<!-- redis集群 -->
docker pull grokzen/redis-cluster:5.0.10