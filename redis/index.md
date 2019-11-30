wget https://github.com/antirez/redis/archive/5.0.5.tar.gz

tar -zxf 5.0.5.tar.gz
cd redis-5.0.5/deps && make jemalloc && make hiredis && make linenoise && make lua
cd .. && make PREFIX=/usr/local/redis && make install
