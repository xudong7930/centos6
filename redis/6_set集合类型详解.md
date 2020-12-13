# Set(集合)

set中的值不能重复

```
127.0.0.1:6379> sadd aset one two  #往集合里添加元素
(integer) 2
127.0.0.1:6379> sadd aset two
(integer) 0
127.0.0.1:6379> sadd aset three
(integer) 1
127.0.0.1:6379> smembers aset #查看集合中的元素
1) "two"
2) "three"
3) "one"
127.0.0.1:6379> sismember aset two #查看集合中元素是否存在
(integer) 1
127.0.0.1:6379> sismember aset 111
(integer) 0

127.0.0.1:6379> scard aset #集合中元素个数
(integer) 3

##############################################
127.0.0.1:6379> smembers aset
1) "two"
2) "three"
3) "one"
127.0.0.1:6379> srem aset one #移除集合中的元素
(integer) 1
127.0.0.1:6379> smembers aset
1) "two"
2) "three"

##############################################
127.0.0.1:6379> srandmember aset 1 #集合中随机取出一个元素
1) "two"

##############################################
127.0.0.1:6379> spop aset 1 #随机删除集合中的一个元素
1) "three"
127.0.0.1:6379> smembers aset
1) "two"

##############################################
127.0.0.1:6379> smembers aset
1) "two"
2) "four"
3) "three"
4) "one"
127.0.0.1:6379> smove aset bset two #移动集合的一个元素到另一个集合
(integer) 1
127.0.0.1:6379> smembers bset
1) "two"
127.0.0.1:6379> smembers aset
1) "four"
2) "three"
3) "one"


##############################################
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


https://www.ixigua.com/6810950193102455310?id=6811359940360274436&logTag=pmZuijC5wpvH_KhXQ2maU
