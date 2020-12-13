# list列表类型详解

> list的使用场景

* 堆，栈，队列，阻塞队列

```
# 添加队列元素
127.0.0.1:6379> lpush list redis #将元素放到列表头部
(integer) 1
127.0.0.1:6379> lpush list mongo
(integer) 2
127.0.0.1:6379> lpush list mysql
(integer) 3
127.0.0.1:6379> rpush list memcache #将元素放到列表尾部
(integer) 4

# 取得队列元素
127.0.0.1:6379> lrange list 0 -1
1) "mysql"
2) "mongo"
3) "redis"

# 移除队列元素
127.0.0.1:6379> lrange list 0 -1
1) "mysql"
2) "mongo"
3) "redis"
4) "memcache"
127.0.0.1:6379> lpop list #移除列表头部元素
"mysql"
127.0.0.1:6379>  lrange list 0 -1
1) "mongo"
2) "redis"
3) "memcache"
127.0.0.1:6379> rpop list #移除列表尾部元素
"memcache"

127.0.0.1:6379> lindex list 0 #根据索引取得元素
"mongo"

127.0.0.1:6379> llen list #列表元素个数
(integer) 2

#删除列表元素
127.0.0.1:6379> lrange list 0 -1
1) "mongo"
2) "redis"
127.0.0.1:6379> lrem list 1 redis #删除列表元素，1-删除个数，因为列表元素可重复
(integer) 1
127.0.0.1:6379> lrange list 0 -1
1) "mongo"

# 元素截取
127.0.0.1:6379> lrange list 0 -1
1) "memcache"
2) "mysql"
3) "redis"
4) "mongo"
127.0.0.1:6379> ltrim list 1 2 #修剪
OK
127.0.0.1:6379> lrange list 0 -1
1) "mysql"
2) "redis"

# 移除最后一个元素，并添加到新的列表中
127.0.0.1:6379> lrange list 0 -1
1) "memcache"
2) "mongo"
3) "mysql"
4) "redis"
127.0.0.1:6379> rpoplpush list other_list # 移除最后一个元素，并添加到新的列表中
"redis"
127.0.0.1:6379> lrange list 0 -1
1) "memcache"
2) "mongo"
3) "mysql"
127.0.0.1:6379> lrange other_list 0 -1
1) "redis"

#设置列表指定元素的值
127.0.0.1:6379> lrange list 0 -1
1) "memcache"
2) "mongo"
3) "mysql"
127.0.0.1:6379> lset list 1 dongcidaci #设置索引为1列表的值
OK
127.0.0.1:6379> lrange list 0 -1
1) "memcache"
2) "dongcidaci"
3) "mysql"
127.0.0.1:6379> lset list 4 dongcidaci #设置索引为4列表的值，不存在会报错
(error) ERR index out of range

# 插入值
127.0.0.1:6379> lrange list 0 -1
1) "memcache"
2) "dongcidaci"
3) "mysql"
127.0.0.1:6379> linsert list before mysql redis #在列表中mysql元素之前插入值，before|after
(integer) 4
127.0.0.1:6379> lrange list 0 -1
1) "memcache"
2) "dongcidaci"
3) "redis"
4) "mysql"
```



> 小结

* list实际上市一个链表，before NODE after, left, right都可以插入值
* 如果key不存在，创建新的链表 
* 两遍插入或改动值，效率最高；中间元素操作，效率较低
* 消息排队，消息队列: lpush, rpop;  栈：lpush, lpop





















