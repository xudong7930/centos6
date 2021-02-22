# Redis入门

## 概述
> Redis是什么？
Redis（remote dictionary server）远程字典服务，是一个开源的使用C编写，支持网络，可基于内存也可持久化的日志型，key-value数据库，提供多种语言API

> Redis能干嘛？
1.内存存储，持久化,内存中断电即失，所以持久化很重要(rdb,aof)
2.效率高，用于高速缓存
3.发布订阅系统
4.地图信息分析
5.计时器，计数器（微信文章浏览量）
...

特点： 
  1.多样的数据类型
  2.支持持久化
  3.支持集群
  4.支持事务

> 学习中的东西
1.官网：https://redis.io
2.中文: http://www.redis.cn


## 安装
见install.md


## 测试性能

> redis-benchmark是一个压力测试工具

redis-benchmark --help

redis-benchmark -h 127.0.0.1 -p 6379  -c 并发连接数 -n 每个连接请求数


> 压力测试结果说明

```
====== SET ======
  5 requests completed in 0.00 seconds  #对5个请求写入(set)测试
  10 parallel clients   #10个并发客户端
  3 bytes payload       #每次写入3个字节
  keep alive: 1         #只有一台服务器处理请求

100.00% <= 0 milliseconds  #处理进度
5000.00 requests per second #每秒处理5000个请求
```
