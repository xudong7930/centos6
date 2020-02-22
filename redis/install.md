wget https://github.com/antirez/redis/archive/5.0.5.tar.gz

tar -zxf 5.0.5.tar.gz
cd redis-5.0.5/deps && make jemalloc && make hiredis && make linenoise && make lua
cd .. && make PREFIX=/usr/local/redis && make install


# 使用
```
#命令行连接redis
redis-cli -h 127.0.0.1 -p 6379 -a vagrant
```