# Set(集合)

set中的值不能重复

```
# 集合添加元素
127.0.0.1:6379> sadd aset one two  #添加多个
(integer) 2
127.0.0.1:6379> sadd aset three #添加单个
(integer) 0

#查看集合中的元素
127.0.0.1:6379> smembers aset 
1) "two"
2) "three"
3) "one"

#查看集合中元素是否存在
127.0.0.1:6379> sismember aset two 
(integer) 1

#集合中元素个数
127.0.0.1:6379> scard aset 
(integer) 3


# 移除指定的元素
127.0.0.1:6379> smembers aset
1) "two"
2) "three"
3) "one"
127.0.0.1:6379> srem aset one #移除集合中的元素
(integer) 1
127.0.0.1:6379> smembers aset
1) "two"
2) "three"



#集合中随机取出2元素
127.0.0.1:6379> srandmember aset 2
1) "two"
2) "one"


#随机删除集合中的一个元素,并返回
127.0.0.1:6379> spop aset 1 
1) "three"
127.0.0.1:6379> smembers aset
1) "two"


#移动集合的一个元素到另一个集合
127.0.0.1:6379> smembers aset
1) "two"
2) "four"
3) "three"
4) "one"
127.0.0.1:6379> smove aset bset two 
(integer) 1
127.0.0.1:6379> smembers bset
1) "two"
127.0.0.1:6379> smembers aset
1) "four"
2) "three"
3) "one"


#集合的交集，差集，并集(共同好友)
127.0.0.1:6379> smembers aset
1) "two"
2) "four"
3) "three"
4) "one"
127.0.0.1:6379> smembers bset
1) "two"
2) "six"
3) "five"
127.0.0.1:6379> sdiff aset bset  # 集合aset和bset的差集
1) "four"
2) "one"
3) "three"
127.0.0.1:6379> sinter aset bset # 集合aset和bset的交集
1) "two"
127.0.0.1:6379> sunion aset bset # 集合aset和bset的并集
1) "one"
2) "three"
3) "two"
4) "four"
5) "five"
6) "six"
```

# 设置key过期
```
127.0.0.1:6379> expire myset 10
(integer) 1
```

