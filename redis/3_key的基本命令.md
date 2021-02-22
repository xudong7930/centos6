# redis的key命令

> redis是一个开源许可的 内存中的数据结构存储系统，它可以用作数据库，缓存和消息中间件。它有多种数据类型，redis内置了 复制，lua脚本，lru驱动事件，事务和不同级别的磁盘持久化，并通过redis哨兵和自动分区（集群）提高可用性。

```
127.0.0.1:6379[5]> set name sbjsw
OK
127.0.0.1:6379[5]> get name #获得key
sbjsw
127.0.0.1:6379[5]> keys * #查看所有key
1) "age"
2) "name"
127.0.0.1:6379[5]> exists name #判断key存在
(integer) 1
127.0.0.1:6379[5]> move name 1 #移动key到DB1
(integer) 1 
127.0.0.1:6379[1]> expire name 5 #设置key 5秒过期
(integer) 1
127.0.0.1:6379[1]> ttl name #查看剩余过期时间
(integer) -2
127.0.0.1:6379[5]> type age #查看key的类型
string
127.0.0.1:6379[1]> del name #删除key
(integer) 1
127.0.0.1:6379[1]> exists name
(integer) 0
```


