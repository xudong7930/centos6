# hash类型详解

Map集合，key-map时候是一个map集合！本质和String类型没有太大区别

```
127.0.0.1:6379> hset myhash k1 v1  #设置一个hash
(integer) 1

127.0.0.1:6379> hget myhash k1  #取得hash中的一个值
"v1"

# 批量设置和获取值
127.0.0.1:6379> hmset myhash k2 v2 k3 v3 k4 v4 #批量设置值
OK
127.0.0.1:6379> hmget myhash k1 k2 k3 #批量取得值
1) "v1"
2) "v2"
3) "v3"


#取得所有值
127.0.0.1:6379> hgetall myhash  
1) "k1"
2) "v1"
3) "k2"
4) "v2"
5) "k3"
6) "v3"
7) "k4"
8) "v4"


#删除指定的key
127.0.0.1:6379> hdel myhash k1  
(integer) 1
127.0.0.1:6379> hgetall myhash
1) "k2"
2) "v2"
3) "k3"
4) "v3"
5) "k4"
6) "v4"


#hash集合中元素个数
127.0.0.1:6379> hlen myhash 
(integer) 3


#判断是否存在
127.0.0.1:6379> hexists myhash k2 #判断hash中指定key是否存在
(integer) 1
127.0.0.1:6379> hexists myhash k1
(integer) 0


#取得hash中所有的key和valus
127.0.0.1:6379> hkeys myhash  
1) "k2"
2) "k3"
3) "k4"

127.0.0.1:6379> hvals myhash 
1) "v2"
2) "v3"
3) "v4"


#hash中的自增自减
127.0.0.1:6379> hset myhash age 34
(integer) 1
127.0.0.1:6379> hincrby myhash age 1  #设置hash自增, hincrby
(integer) 35


# 不存在则创建
127.0.0.1:6379> hsetnx myhash age 44 #设置hash键值对，不存在就创建，存在就创建失败
(integer) 0

```

> hash的应用
用户信息的保存，经常变动的信息
hset user:1 first_name 1

```
127.0.0.1:6379> hset user:1 first_name sb last_name jsw age 22 mobile 15811448243
(integer) 4
127.0.0.1:6379> hgetall user:1
1) "first_name"
2) "sb"
3) "last_name"
4) "jsw"
5) "age"
6) "22"
7) "mobile"
8) "15811448243"
```
