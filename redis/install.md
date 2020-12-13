centos使用yum安装redis3.2
========================


## 第三方仓库安装方式
> curl https://setup.ius.io | sh

## 安装
> yum -y install redis

## 配置
```
vim /etc/redis.conf
480行: requirepass xudong7930
```

## 启动
```
systemctl start redis.service
systemctl stop redis.service
systemctl restart redis.service
```



# 编译安装
```
wget https://github.com/antirez/redis/archive/5.0.5.tar.gz
tar -zxf 5.0.5.tar.gz
cd redis-5.0.5/deps && make jemalloc && make hiredis && make linenoise && make lua
cd .. && make PREFIX=/usr/local/redis && make install

# 启动
redis-server ./redis.conf
```

# 使用
```
#命令行连接redis
redis-cli -h 127.0.0.1 -p 6379 -a vagrant
```
