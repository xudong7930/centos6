# string字符串类型

> string类型的使用场景
* 计数器
* 统计多单位数量  mset uid:1999:views 1000
* 对象缓存
* 粉丝数


```
127.0.0.1:6379[5]> append name sbjs  #字符串追加值
(integer) 4
127.0.0.1:6379[5]> strlen name  #值的长度
(integer) 4


# 自增操作（文章浏览数） incr/decr | incrby/decrby
127.0.0.1:6379[5]> set age 30
ok
127.0.0.1:6379[5]> incr age
(integer) 31
127.0.0.1:6379[5]> incrby age 10
(integer) 41

# 字符串截取
127.0.0.1:6379[5]> getrange name 0 5 #字符串长度截取
"sbjs"
127.0.0.1:6379[5]> getrange name 0 -1 #字符串长度截取
"sbjs"

127.0.0.1:6379[5]> setrange name 1 bbbb # 字符串替换，从位置1开始
(integer) 5
127.0.0.1:6379[5]> get name
"sbbbb"

127.0.0.1:6379> setex name 30 hello #设置30秒过期
OK
127.0.0.1:6379> ttl name
(integer) 23

127.0.0.1:6379> setnx name 4  # 不存在则设置,存在则设置失败(分布式锁中使用)
(integer) 1
127.0.0.1:6379> setnx name 4
(integer) 0


#批量设置，批量获取
127.0.0.1:6379> mset a1 val1 a2 val2
OK
127.0.0.1:6379> mget a1 a2
1) "val1"
2) "val2"

127.0.0.1:6379> msetnx a1 valll a3 val3 #a1已经存在，a3不存在，设置失败
(integer) 0

127.0.0.1:6379> mset blog:1:views 222 #设置文章访问量
OK
127.0.0.1:6379> mget blog:1:views
1) "222"


127.0.0.1:6379> getset db redis #获取原值，设置新的值
(nil)
127.0.0.1:6379> getset db mysql
"redis"
```


